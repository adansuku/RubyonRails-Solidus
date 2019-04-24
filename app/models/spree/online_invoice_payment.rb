class Spree::OnlineInvoicePayment
  include ActiveModel::Model
  attr_accessor  :order, :address, :adjustment

  def order_attributes=(attributes)
    @order ||= Spree::Order.new(attributes)
  end
  def address_attributes=(attributes)
    @address ||= Spree::Address.new(attributes)
  end
  def adjustment_attributes=(attributes)
    @adjustment ||= Spree::Adjustment.new(attributes)
  end
end