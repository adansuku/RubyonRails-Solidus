# This migration comes from solidus_tobe_improvements (originally 20150918175956)
class AddGoogleTagManagerToTrackers < ActiveRecord::Migration
  def change
    add_column  :spree_trackers,  :gtm_id,  :string
  end
end