class AddFeaturedTagToSpreeProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_products, :featured_tag, :text
		unless column_exists?(:spree_product_translations, :featured_tag)
			add_column :spree_product_translations, :featured_tag, :text
		end
  end
end
