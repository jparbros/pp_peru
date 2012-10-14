class AddColumnToStrategicObjective < ActiveRecord::Migration
  def change
    add_column :strategic_objectives, :type_id, :integer
    add_column :strategic_objectives, :type_description, :string
  end
end
