Spree::Promotion.class_eval do
    private
    def blacklisted?(promotable)
      case promotable
      when Spree::LineItem
        !promotable.product.promotionable?
      when Spree::Order
        promotable.line_items.any? &&
          promotable.line_items.joins(:product).where(spree_products: { promotionable: false }).any?
      when Spree::Shipment
        promotions = self.rules.find_by(type: "Spree::Promotion::Rules::User")
        if promotions.respond_to?(:users)
          return !promotions.users.include?(promotable.order.user)
        else
          return false
        end
      end
    end
end