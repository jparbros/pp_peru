class JoinAttendesObjectiveStrategic < ActiveRecord::Migration
  def up
    create_table :attendees_strategic_objectives, :id => false do |t|
      t.references :strategic_objective, :null => false
      t.references :attendee, :null => false
    end
  end

  def down
    drop_table :attendees_strategic_objectives
  end
end