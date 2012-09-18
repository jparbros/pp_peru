class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.integer :group_id
      t.integer :paper_id

      t.timestamps
    end
  end
end
