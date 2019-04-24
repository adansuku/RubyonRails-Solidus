class AddSentAsGiftToSpreeOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_orders, :sent_as_a_gift, :boolean
  end
end
