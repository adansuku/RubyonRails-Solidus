module Spree
  module Api
    class PricesController < Spree::Api::BaseController
      before_action :find_price, only: [:show, :update, :destroy]
      def show
        expires_in 15.minutes, public: true
        headers['Surrogate-Control'] = "max-age=#{15.minutes}"
        headers['Surrogate-Key'] = "prices_id=1"
        respond_with(@price)
      end

      def create
        id = Spree::Variant.find_by(sku: params[:price][:variant_id]).id
        params[:price][:variant_id] = id
        authorize! :create, Price
        @price = Spree::Price.new(price_params)
        if @price.save
          render json: @price.to_json, status: 201
        else
          invalid_resource!(@price)
        end
      end

      def update
        authorize! :update, Price
        if @price.update_attributes(price_params)
          render json: @price.to_json
        else
          invalid_resource!(@price)
        end
      end

      def destroy
        authorize! :destroy, Price
        @price.destroy
        respond_with(@price, status: 204)
      end

      private

      def price_params
        params.require(:price).permit(*permitted_attributes)
      end

      def permitted_attributes
        [
          :variant_id,
          :currency,
          :country_iso,
          :price
        ]
      end

      def find_price
        @price = Spree::Price.find_by(variant_id: params[:price][:variant_id], country_iso: params[:price][:country_iso])
      end

      def model_class
        Spree::Price
      end
    end
  end
end
