# This migration comes from solidus_trackers (originally 20160920231000)
class AddStoreToTracker < ActiveRecord::Migration
  def self.up
    if data_source_exists?('spree_trackers')
      change_table :spree_trackers do |t|
        t.references :store
      end
    end
  end

  def self.down
    if data_source_exists?('spree_trackers')
      change_table :spree_trackers do |t|
        t.remove :store_id
      end
    end
  end
end
