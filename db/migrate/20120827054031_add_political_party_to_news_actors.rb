class AddPoliticalPartyToNewsActors < ActiveRecord::Migration
  def change
    add_column :news_actors, :political_party_id, :integer
  end
end
