# This migration comes from solidus_tobe_improvements (originally 20161220070357)
class AddFacebookPixelIdToSpreeTrackers < ActiveRecord::Migration
  def change
    add_column :spree_trackers, :facebook_pixel_id, :string
  end
end
