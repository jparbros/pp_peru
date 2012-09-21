class JoinUserPermissionToUser < ActiveRecord::Migration
  def up
    create_table :user_permissions_users, :id => false do |t|
      t.references :user_permission, :null => false
      t.references :user, :null => false
    end
  end

  def down
    drop_table :user_permissions_users
  end
end