class AddPickedStoreToSpreeOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_orders, :picked_store, :string
  end
end
