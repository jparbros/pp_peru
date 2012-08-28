class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :message
      t.references :author

      t.timestamps
    end
    add_index :messages, :author_id
  end
end
