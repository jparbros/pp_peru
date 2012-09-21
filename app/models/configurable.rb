class Configurable < ActiveRecord::Base
  
  #
  # Accessors
  #
  attr_accessible :color1, :color2, :color3, :color4, :color5, :comments_limit, :footer_image, :header_image, :home_main_content, :background_image, :site_name, :public_registration, :registration_mail_content
  
  #
  # Uploaders
  #
  mount_uploader :header_image, HeaderImageUploader
  mount_uploader :footer_image, FooterImageUploader
  mount_uploader :background_image, BackgroundImageUploader
  
  set_table_name 'configurations'
        
  def array_colors
    [color1, color2, color3, color4, color5]
  end
  
end