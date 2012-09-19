class AddSearchIndexToPaper < ActiveRecord::Migration
  
  def up
    execute "create index papers_title on papers using gin(to_tsvector('spanish', title))"
    execute "create index papers_content on papers using gin(to_tsvector('spanish', content))"
  end

  def down
    execute "drop index papers_title"
    execute "drop index papers_content"
  end
end
