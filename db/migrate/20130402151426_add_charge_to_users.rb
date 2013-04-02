class AddChargeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :charge, :string
  end
end
