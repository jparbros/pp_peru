class AddPoliticalPartyToUser < ActiveRecord::Migration
  def change
    add_column :users, :political_party_id, :integer
  end
end
