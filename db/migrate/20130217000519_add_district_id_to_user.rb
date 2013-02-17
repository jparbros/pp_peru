class AddDistrictIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :district_id, :integer
  end
end
