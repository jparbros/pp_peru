class SetupUserRoleMigration < ActiveRecord::Migration
  def up
    add_column :users, :role_id, :integer, default: 1
    rename_column :users, :role, :role_c
    rename_table :user_permissions, :role_permissions
    drop_table :user_permissions_users
    
    create_table :role_permissions_roles, :id => false do |t|
      t.references :role_permission, :null => false
      t.references :role, :null => false
    end
  end

  def down
    remove_column :users, :role_id
    rename_column :users, :role_c, :role
    rename_table :role_permissions, :user_permissions
    drop_table :role_permissions_roles
    
    create_table :user_permissions_users, :id => false do |t|
      t.references :user_permission, :null => false
      t.references :user, :null => false
    end
  end
end
