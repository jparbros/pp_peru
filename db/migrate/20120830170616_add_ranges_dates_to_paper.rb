class AddRangesDatesToPaper < ActiveRecord::Migration
  def change
    add_column :papers, :published_end_at, :datetime
  end
end
