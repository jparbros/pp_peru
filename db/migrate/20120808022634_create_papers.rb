class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :title
      t.text :content
      t.integer :author_id
      t.string :type
      t.string :status

      t.timestamps
    end
  end
end
