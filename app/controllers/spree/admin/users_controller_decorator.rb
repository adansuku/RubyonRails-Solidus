Spree::Admin::UsersController.class_eval do

  private

  def collection
    return @collection if @collection.present?
    if request.xhr? && params[:q].present?
      @collection = Spree.user_class.includes(:bill_address, :ship_address)
                        .where("spree_users.email #{LIKE} :search
                               OR (spree_addresses.firstname #{LIKE} :search AND spree_addresses.id = spree_users.bill_address_id)
                               OR (spree_addresses.lastname  #{LIKE} :search AND spree_addresses.id = spree_users.bill_address_id)
                               OR (spree_addresses.firstname #{LIKE} :search AND spree_addresses.id = spree_users.ship_address_id)
                               OR (spree_addresses.lastname  #{LIKE} :search AND spree_addresses.id = spree_users.ship_address_id)",
                              { search: "#{params[:q].strip}%" })
                        .limit(params[:limit] || 100)
    else
      if params[:find_user_by].present?
        @search = Spree.user_class.ransack(params[:q])
        users = Spree::User.joins(:addresses).where("spree_users.email like :search
                                        OR (spree_addresses.firstname like :search AND spree_addresses.id = spree_users.bill_address_id)
                                        OR (spree_addresses.lastname like :search AND spree_addresses.id = spree_users.bill_address_id)",
                                        { search: "%#{params[:find_user_by].strip}%" }).distinct.page(params[:page]).per(Spree::Config[:admin_products_per_page])
        users = Spree::User.where(email: params[:find_user_by].strip).distinct.page(params[:page]).per(Spree::Config[:admin_products_per_page]) if users.blank?
        @collection = users
      else
        @search = Spree.user_class.ransack(params[:q])
        @collection = @search.result.page(params[:page]).per(Spree::Config[:admin_products_per_page])
      end
    end
  end
end