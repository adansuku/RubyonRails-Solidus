class CreateSpreePromotionActionLineItems < ActiveRecord::Migration[5.0]
  def up
    create_table :spree_promotion_action_line_items, :force => true do |t|
      t.references :promotion_action
      t.references :variant
      t.integer    :quantity,            :default => 1
    end
  end
  def down 
  	drop_table :spree_promotion_action_line_items
  end
end
