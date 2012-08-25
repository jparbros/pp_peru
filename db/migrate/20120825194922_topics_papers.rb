class TopicsPapers < ActiveRecord::Migration
  def up
    create_table :papers_topics, :id => false do |t|
       t.references :topic, :null => false
       t.references :paper, :null => false
    end
  end

  def down
    drop_table :papers_topics
  end
end