class AddPpObjectiveToStrategicObjectives < ActiveRecord::Migration
  def change
    add_column :strategic_objectives, :political_party_objective, :boolean
  end
end
