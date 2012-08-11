class NewsActorsPapers < ActiveRecord::Migration
  def up
    create_table :news_actors_papers, :id => false do |t|
      t.references :news_actor, :null => false
      t.references :paper, :null => false
    end
  end

  def down
     drop_table :news_actors_papers
  end
end
