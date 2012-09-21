class ConfigurableObserver < ActiveRecord::Observer
  
  def before_save(configurable)
    if (configurable.changed & ["color1", "color2", "color3", "color4", "color5"]).size > 0
      ImageCreator.new(:footer, configurable.array_colors).upload_images
      ImageCreator.new(:header, configurable.array_colors).upload_images
    end
  end
  
end
