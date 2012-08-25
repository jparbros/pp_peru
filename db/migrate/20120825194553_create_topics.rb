class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name, default: "", null: false 
      t.timestamps
    end
  end
end
