class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :author_id
      t.integer :tendency
      t.integer :votable_id
      t.string  :votable_type
      t.timestamps
    end
  end
end
