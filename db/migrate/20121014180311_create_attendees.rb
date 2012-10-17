class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :name
      t.string :gender
      t.date :birthday
      t.integer :state_id
      t.string :instruction
      t.string :dni
      t.integer :province_id

      t.timestamps
    end
  end
end
