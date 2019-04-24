# This migration comes from solidus_tobe_improvements (originally 20160330222430)
class AddLocaleToOrders < ActiveRecord::Migration
  def change
    add_column  :spree_orders,  :locale,  :string
  end
end
