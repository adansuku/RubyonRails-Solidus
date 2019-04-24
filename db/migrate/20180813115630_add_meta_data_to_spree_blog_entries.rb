class AddMetaDataToSpreeBlogEntries < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_blog_entries, :meta_title, :string
    add_column :spree_blog_entries, :meta_keywords, :string
    add_column :spree_blog_entries, :meta_description, :string
  end
end
