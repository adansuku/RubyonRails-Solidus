class AddSentAsGiftTextToSpreeOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_orders, :send_gift_text, :text
  end
end
