class ChangesBodyToSpreePages < ActiveRecord::Migration
  def up
    change_column :spree_pages, :body, :longtext
    change_column :spree_page_translations, :body, :longtext
  end

  def down
    change_column :spree_pages, :body, :text
    change_column :spree_page_translations, :body, :text
  end
end
