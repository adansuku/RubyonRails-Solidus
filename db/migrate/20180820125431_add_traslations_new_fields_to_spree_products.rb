class AddTraslationsNewFieldsToSpreeProducts < ActiveRecord::Migration[5.0]
  def change
    Spree::Product.add_translation_fields! composition_and_care: :string 
	end
end
