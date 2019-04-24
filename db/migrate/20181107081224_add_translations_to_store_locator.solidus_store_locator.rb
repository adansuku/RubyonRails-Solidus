# This migration comes from solidus_store_locator (originally 20181107081109)
class AddTranslationsToStoreLocator < ActiveRecord::Migration
  def up
    unless table_exists?(:spree_store_locator_translations)
      params = { address1: :string, address2: :string, city: :string, country: :string, state: :string, name: :string}
      Spree::StoreLocator.create_translation_table!(params, { migrate_data: true })
    end
  end

  def down
    Spree::StoreLocator.drop_translation_table! migrate_data: true
  end
end