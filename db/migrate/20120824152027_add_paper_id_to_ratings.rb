class AddPaperIdToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :paper_id, :integer
  end
end
