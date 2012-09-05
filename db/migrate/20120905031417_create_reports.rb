class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :author_id
      t.integer :reportable_id
      t.string  :reportable_type
      t.timestamps
    end
  end
end