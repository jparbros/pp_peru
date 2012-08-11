class CreateNewsActors < ActiveRecord::Migration
  def change
    create_table :news_actors do |t|
      t.string :name, default: "", null: false 
      t.string :avatar, default: ""
      t.timestamps
    end
  end
end
