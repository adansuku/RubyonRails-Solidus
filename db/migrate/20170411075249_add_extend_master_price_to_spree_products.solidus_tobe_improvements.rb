# This migration comes from solidus_tobe_improvements (originally 20161006104815)
class AddExtendMasterPriceToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :extend_master_price, :boolean, default: true
  end
end
