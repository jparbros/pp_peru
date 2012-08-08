class CreateAnnotations < ActiveRecord::Migration
  def change
    create_table :annotations do |t|
      t.string :title
      t.text :comment
      t.integer :annotable_id
      t.string :annotable_type
      t.integer :author_id
      t.string :status
      t.integer :reports
      t.string :ancestry

      t.timestamps
    end

    add_index :annotations, :ancestry
  end
end
