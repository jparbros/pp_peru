class AddNumberDocumentToUser < ActiveRecord::Migration
  def change
    add_column :users, :dni, :string
    add_column :users, :middle_name, :string
    add_column :users, :last_name, :string
    add_column :users, :date_of_birth, :date
  end
end
