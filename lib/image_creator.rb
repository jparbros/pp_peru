class ImageCreator
  
  #
  # Accessors
  #
  attr_accessor :name, :image
  
  def initialize(type = :footer, colors = [], name = nil)
    set_values(type, colors, name)
    fill_image
    @image.save @name
  end
  
  def set_values(type, colors, name)
    @type = type.to_sym
    @colors = colors
    @width = footer? ? 54 : 3
    @image = QuickMagick::Image::solid(900, @width, :white)
    @name = name.nil? ? "tmp/#{@type}-#{SecureRandom.hex}.png" : "tmp/#{name}"
  end
  
  def fill_image
    @colors.each_with_index do |color, index|
      if color.present?
        x_coord_1 = 180 * index
        x_coord_2 = 180 * (index + 1)
        @image.draw_rectangle(x_coord_1, 0, x_coord_2, @width, {fill: color})
      end
    end
  end
  
  def upload_images
    if footer?
      uploader = FooterImageUploader.new
      uploader.store!(File.open(@name))
      Setting.destroy :footer_image if Setting.footer_image.present?
      Setting.footer_image = uploader.url
    else
      HeaderImageUploader
      uploader = HeaderImageUploader.new
      uploader.store!(File.open(@name))
      Setting.destroy :header_image if Setting.header_image.present?
      Setting.header_image = uploader.url
    end
    File.delete(@name)
  end
  
  def footer?
    @type == :footer
  end
  
  def header?
    @type == :header
  end
  
  
end