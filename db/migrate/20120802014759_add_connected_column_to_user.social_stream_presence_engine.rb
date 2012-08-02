# This migration comes from social_stream_presence_engine (originally 20110711111408)
class AddConnectedColumnToUser < ActiveRecord::Migration
  def self.up
     add_column :users, :connected, :boolean, :default => false
  end

  def self.down
    remove_column :users, :connected
  end
end
