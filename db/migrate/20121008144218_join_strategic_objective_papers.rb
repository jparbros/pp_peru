class JoinStrategicObjectivePapers < ActiveRecord::Migration
  def up
    create_table :papers_strategic_objectives, :id => false do |t|
      t.references :strategic_objective, :null => false
      t.references :paper, :null => false
    end
  end

  def down
    drop_table :papers_strategic_objectives
  end
end
