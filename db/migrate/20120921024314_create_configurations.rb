class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :configurations do |t|
      t.string :site_name
      t.string :color1
      t.string :color2
      t.string :color3
      t.string :color4
      t.string :color5
      t.string :comments_limit
      t.string :footer_image
      t.string :header_image
      t.string :background_image
      t.boolean :public_registration
      t.text :home_main_content
      t.text :registration_mail_content

      t.timestamps
    end
    Configuration.create
  end
end
