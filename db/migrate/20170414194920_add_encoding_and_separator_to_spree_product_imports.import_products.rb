# This migration comes from import_products (originally 20160508141844)
class AddEncodingAndSeparatorToSpreeProductImports < ActiveRecord::Migration
  def change
    add_column :spree_product_imports, :separatorChar, :string
    add_column :spree_product_imports, :encoding_csv, :string
    add_column :spree_product_imports, :quoteChar, :string
  end
end
