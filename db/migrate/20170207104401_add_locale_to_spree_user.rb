class AddLocaleToSpreeUser < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_users, :locale, :string
  end
end
