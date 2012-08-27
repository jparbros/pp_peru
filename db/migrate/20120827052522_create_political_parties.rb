class CreatePoliticalParties < ActiveRecord::Migration
  def change
    create_table :political_parties do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
