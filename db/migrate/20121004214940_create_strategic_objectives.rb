class CreateStrategicObjectives < ActiveRecord::Migration
  def change
    create_table :strategic_objectives do |t|
      t.string  :title
      t.text    :description
      t.boolean :accomplished
      t.date    :date_objective
      t.string  :ancestry

      t.timestamps
    end
    add_index :strategic_objectives, :ancestry
  end
end
