# == Schema Information
#
# Table name: configurations
#
#  id                        :integer          not null, primary key
#  site_name                 :string(255)
#  color1                    :string(255)
#  color2                    :string(255)
#  color3                    :string(255)
#  color4                    :string(255)
#  color5                    :string(255)
#  comments_limit            :string(255)
#  footer_image              :string(255)
#  header_image              :string(255)
#  background_image          :string(255)
#  public_registration       :boolean
#  home_main_content         :text
#  registration_mail_content :text
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

class Configurable < ActiveRecord::Base
  
  #
  # Accessors
  #
  attr_accessible :color1, :color2, :color3, :color4, :color5, :comments_limit, :footer_image, :header_image, 
                  :home_main_content, :background_image, :site_name, :public_registration, :registration_mail_content, 
                  :image_x, :image_y
  attr_accessor :image_x, :image_y
  
  #
  # Uploaders
  #
  mount_uploader :header_image, HeaderImageUploader
  mount_uploader :footer_image, FooterImageUploader
  mount_uploader :background_image, BackgroundImageUploader
  
  self.table_name = 'configurations'
        
  def array_colors
    [color1, color2, color3, color4, color5]
  end
  
  def home_main_content_safe
    home_main_content.gsub('\"','"')
  end
  
end
