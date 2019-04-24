Spree::Calculator::Shipping::PriceSack.class_eval do

      def compute_package(package)
        compute_from_price(package.order.total)
      end

      def compute_from_price(price)
        if price < preferred_minimal_amount
          preferred_normal_amount
        else
          preferred_discount_amount
        end
      end
end
