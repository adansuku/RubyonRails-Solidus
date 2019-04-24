class AddNewFiledsToSpreeAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_addresses, :birth_day, :string
    add_column :spree_addresses, :dni, :string
    add_column :spree_addresses, :request_invoice, :boolean, default: false
  end
end
