class AddContentToNewsActor < ActiveRecord::Migration
  def change
    add_column :news_actors, :content, :text
  end
end
