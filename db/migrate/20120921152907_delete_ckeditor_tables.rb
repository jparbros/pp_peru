class DeleteCkeditorTables < ActiveRecord::Migration
  def up
    drop_table :ckeditor_assets
  end

  def down
  end
end
