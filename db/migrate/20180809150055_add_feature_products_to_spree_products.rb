class AddFeatureProductsToSpreeProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_products, :featured_product, :boolean, default: false
  end
end
