class Admin::ConfigurationsController < Admin::BaseController

  def show
    authorize! :config_site, :show
  end
  
  def edit
    authorize! :config_site, :edit
  end
  
  def update
    authorize! :config_site, :update
    
    upload_background_image if params[:background_image][:file].present?
    upload_style_images
    
    params[:setting].each do |setting|
      Setting[setting.first] = setting.last
    end
    redirect_to admin_configuration_url
  end
  
  private
  
  def upload_background_image
    uploader = BackgroundImageUploader.new
    file = params[:background_image].delete(:file)
    uploader.image_x = params[:background_image][:image_x]
    uploader.image_y = params[:background_image][:image_y]
    uploader.store!(file)
    Setting.background_image = uploader.url
  end
  
  def upload_style_images
    settings = params[:setting]
    unless Setting.color1.equal?(settings[:color1]) || Setting.color2.equal?(settings[:color2]) || Setting.color3.equal?(settings[:color3]) || Setting.color4.equal?(settings[:color4]) || Setting.color5.equal?(settings[:color5])
      ImageCreator.new(:footer, Setting.array_colors).upload_images
      ImageCreator.new(:header, Setting.array_colors).upload_images
    end
  end
end
