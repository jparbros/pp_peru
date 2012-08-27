class AddPoliticalPartyIdToPapers < ActiveRecord::Migration
  def change
    add_column :papers, :political_party_id, :integer
  end
end
