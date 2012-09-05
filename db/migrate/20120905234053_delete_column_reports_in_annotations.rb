class DeleteColumnReportsInAnnotations < ActiveRecord::Migration
  def up
    remove_column :annotations, :reports
  end

  def down
    add_column :annotations, :reports, :integer, :default => 0
  end
end
