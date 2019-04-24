# This migration comes from solidus_store_locator (originally 20151130191933)
class AddAttachmentImageToStoreLocators < ActiveRecord::Migration
  def self.up
    change_table :spree_store_locators do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :spree_store_locators, :image
  end
end
