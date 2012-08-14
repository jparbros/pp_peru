class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rateable_id
      t.string  :rateable_type
      t.integer :author_id
      t.float   :rate
      t.timestamps
    end
  end
end
