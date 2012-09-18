class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :string
    add_column :users, :state_id, :integer
    add_column :users, :province_id, :integer
  end
end
