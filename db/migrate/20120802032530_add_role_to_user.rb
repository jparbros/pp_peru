class AddRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, :default => "participant"
  end
end
