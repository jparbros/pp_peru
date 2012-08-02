# This migration comes from social_stream_presence_engine (originally 20110928135031)
class AddStatusColumnToUser < ActiveRecord::Migration
  def self.up
     add_column :users, :status, :string, :default => "available"
  end

  def self.down
    remove_column :users, :status
  end
end
