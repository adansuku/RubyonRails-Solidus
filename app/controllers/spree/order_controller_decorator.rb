Spree::OrdersController.class_eval do    
  respond_to :js, :only => [:populate, :update]

  def populate
    order    = current_order(create_order_if_necessary: true)
    variant  = Spree::Variant.find(params[:variant_id])
    quantity = params[:quantity].to_i
    options  = params[:options] || {}

    # 2,147,483,647 is crazy. See issue #2695.
    if quantity.between?(1, 2_147_483_647)
      begin
        order.contents.add(variant, quantity, options)
      rescue ActiveRecord::RecordInvalid => e
        error = e.record.errors.full_messages.join(", ")
      end
    else
      error = Spree.t(:please_enter_reasonable_quantity)
    end

    if order.store.minimum_order_value.present? && order.total.to_i < order.store.minimum_order_value
      flash.now[:notice] = Spree.t(:buy_more_for_free_shipments, parameter: (order.store.minimum_order_value.to_i - order.total.to_i))
    elsif order.store.minimum_order_value.present?
      flash.now[:notice] = Spree.t(:free_shipments)
    end

    if error
      flash.now[:error] = error
    end
  end
end