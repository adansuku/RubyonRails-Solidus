Spree::Order.class_eval do
  def eligible_for_return_authorization?
    shipment = self.shipments.any? do |s|
      s.shipped? &&
      s.shipped_at.present?
    end
    self.user.present? && shipment && ( !self.approved? || (self.approved? && self.approved_at.present? && self.approved_at > 15.days.ago))
  end
end