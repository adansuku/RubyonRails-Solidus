Spree::Api::VariantsController.class_eval do
    def index
      @variants = scope.includes({ option_values: :option_type }, :product, :default_price, :images, { stock_items: :stock_location })
      .where('sku LIKE ? ' , "#{params[:q][:product_name_or_sku_cont]}%")

      @variants = paginate(@variants)
      respond_with(@variants)
    end
end
