class BarAbility
  include CanCan::Ability

  def initialize(user)
    user ||= Spree::User.new
    if user.has_spree_role? 'blogger'
      # allow dispatch to :admin, :index, and :show on Spree::Order
      #can [:admin, :manage], Spree::Page
      can [:admin, :manage], Spree::BlogEntry
      # can [:admin, :manage], Spree::Variant
      # can [:admin, :manage], Spree::Stock
      # can [:admin, :manage], Spree::StockItem
      # can [:admin, :manage], Spree::StockLocation
      # allow dispatch to :index, :show, :create and :update shipments on the admin
      # can [:admin, :manage], Spree::Shipment
      # can [:admin, :manage], Spree::Product
      # can [:admin, :manage], Spree::ProductProperty
      # can [:admin, :manage], Spree::ProductOptionType
      # can [:admin, :manage], Spree::Image
      #can [:admin, :manage], Spree.user_class
    end
  end
end