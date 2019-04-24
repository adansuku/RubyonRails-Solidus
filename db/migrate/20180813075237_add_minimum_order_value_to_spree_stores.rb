class AddMinimumOrderValueToSpreeStores < ActiveRecord::Migration[5.0]
  def change
  	add_column :spree_stores, :minimum_order_value, :integer
  end
end
