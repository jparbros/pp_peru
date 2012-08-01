# This migration comes from social_stream_presence_engine (originally 20111116194112)
class AddChatEnabledColumnToUser < ActiveRecord::Migration
  def self.up
     add_column :users, :chat_enabled, :boolean, :default => true
  end

  def self.down
    remove_column :users, :chat_enabled
  end
end
