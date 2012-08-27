class AddVisibilityToPapers < ActiveRecord::Migration
  def change
    add_column :papers, :visibility, :string
  end
end
