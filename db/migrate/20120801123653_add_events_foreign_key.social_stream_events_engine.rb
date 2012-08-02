# This migration comes from social_stream_events_engine (originally 20120208144948)
class AddEventsForeignKey < ActiveRecord::Migration
  def up
    add_foreign_key "events", "activity_objects", :name => "events_on_activity_object_id"
  end

  def down
    remove_foreign_key "events", :name => "events_on_activity_object_id"
  end
end
