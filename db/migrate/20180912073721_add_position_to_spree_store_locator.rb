class AddPositionToSpreeStoreLocator < SolidusSupport::Migration[4.2]
  def change
    add_column :spree_store_locators, :position, :integer
    if table_exists?(:spree_store_locators)
		Spree::StoreLocator.order(:updated_at).each_with_index{|store,x| store.update_attribute(:position, x+1)}
	end
  end
end
