class AddNewFieldsToSpreeProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_products, :composition_and_care, :string
  end
end
