class AddAvailableOnToSpreeTaxon < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_taxons, :available_on, :datetime, default: nil
  end
end
