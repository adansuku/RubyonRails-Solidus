#Controller para los pagos de facturas por TPV.
#Para pagar las facturas, se genera una order "fake".
module Spree
  class OnlineInvoicePaymentsController < Spree::StoreController
		#before_action :permit_retail
    #Generamos los objetos de modelo para el formulario.
    def new
      @online_invoice_payment = Spree::OnlineInvoicePayment.new(order: Spree::Order.new)
      @online_invoice_payment.address = Spree::Address.new
      @online_invoice_payment.adjustment = Spree::Adjustment.new
    end
    #Generamos la order "fake".
    #Esta order no tiene line_items, pero tiene un adjustment donde ponemos el número de factura y el
    #importe. También le assignamos una address.
    def create
      verify_recaptcha(:model => @post, :message => "Oh! It's error with reCAPTCHA!")
      if (!status)
        redirect_to new_online_invoice_payment_url and return
      end
      @online_invoice_payment = Spree::OnlineInvoicePayment.new(online_invoice_params)
      @address = @online_invoice_payment.address
      @adjustment = @online_invoice_payment.adjustment
      @order = @online_invoice_payment.order

      #@address.save(validate: false)
      @address.address1 = "María Tubau, 4"
      @address.city = "Madrid"
      @address.zipcode = "28050"
      @address.phone = "+34 915 346 797"
      @address.country_id = 68
      @address.state_id = 3808
      @address.save!()

      @order.number = @order.generate_order_number
      @order.total = @adjustment.amount
      @order.item_total = @order.total
      @order.bill_address_id = @address.id
      @order.ship_address_id = @address.id
      @order.item_count = 1
      @order.state = :payment
      @order.payment_state = :checkout
      @order.save!()

      #Added to build correct order.
      @order.shipments.new(stock_location_id: Spree::StockLocation.first.id)
      @order.shipments.first.save
      @order.shipments.first.shipping_rates.build
      @order.shipments.first.shipping_rates.first.save

      @adjustment.finalized = 1
      @adjustment.included = 0
      @adjustment.source_type = 'App::Invoice'
      @adjustment.adjustable_id = @order.id
      @adjustment.order_id = @order.id
      @adjustment.adjustable_type = 'Spree::Order'
      @adjustment.amount = 0
      @adjustment.save!()

      @payment_method = Spree::PaymentMethod.find(Spree::Config.invoice_payment_id)

      if (!@payment_method.kind_of?(Spree::Config.invoice_payment_class.constantize))
        flash[:payment_error]=Spree.t('invalid_invoice_payment_class')
        error=flash[:payment_error]
        redirect_to new_online_invoice_payment_url and return
      end

      
      #Creamos el objeto redsys que utilizaremos en el formulario.
      @redsys = config_redsys_object
      render 'spree/online_invoice_payments/_checkout', :layout => layout_page(@redsys) and return
    end
    #Función que recibe el KO del TPV. Ponemos el pago como failed.
    #Redireccionamos a new con lo que esta order se pierde para siempre.
    def edit

      return unless (params[:state] == "payment")
      #return unless params[:order][:payments_attributes]

      @order = Spree::Order.find_by_number(params[:id])
      #load_order_with_lock
      @order.update_from_params(params, permitted_checkout_attributes, request.headers.env)
      @payment_method = Spree::PaymentMethod.find(params[:payment_method_id])

      return unless @payment_method.kind_of?(Spree::Config.invoice_payment_class.constantize)

      @order.payments.destroy_all

      @redsys = config_redsys_object

      @order.state = params[:state]
      @order.payment_state=:failed
      @order.save

      redirect_to new_online_invoice_payment_url and return
    end
    private

    def payment_credentials (payment_method)
      if (@payment_method.kind_of?(Spree::BillingIntegration::RedsysPayment))
        {
            :terminal_id   => payment_method.preferred_terminal_id,
            :commercial_id => payment_method.preferred_commercial_id,
            :secret_key    => payment_method.preferred_secret_key,
            :key_type      => payment_method.preferred_key_type
        }
      end
    end
    def render_page (payment_method)
      if (@payment_method.kind_of?(Spree::BillingIntegration::RedsysPayment))
        'spree/shared/_redsys_payment_checkout'
      end
    end
    def layout_page (payment_method)
      if (@payment_method.kind_of?(Spree::BillingIntegration::RedsysPayment))
        'spree_redsys_application'
      end
    end
		
		def online_invoice_params
      params.require(:online_invoice_payment).permit(address_attributes: [:firstname, :lastname, :dni], order_attributes: [:email, :special_instructions], adjustment_attributes: [:amount, :label])
    end

    def config_redsys_object
      return_url = edit_order_checkout_url(@order, :state => 'payment')
      forward_url = redsys_confirm_order_redsys_callbacks_url(@order, :payment_method_id => @payment_method)
      notify_url = redsys_notify_order_redsys_callbacks_url(@order, :payment_method_id => @payment_method)#, :protocol => 'http')
      notify_url = (@payment_method.preferred_notify_alternative_domain_url + redsys_notify_order_redsys_callbacks_path(@order, :payment_method_id => @payment_method)) if @payment_method.preferred_notify_alternative_domain_url.present?
      ActiveMerchant::Billing::Integrations::Redsys.new(@order,@payment_method,return_url,forward_url,notify_url)
    end
  end
end