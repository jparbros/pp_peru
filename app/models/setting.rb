class Setting < RailsSettings::CachedSettings
  attr_accessible :var
  
  def self.array_colors
    [self.color1, self.color2, self.color3, self.color4, self.color5]
  end
  
  def self.home_main_content_safe
    self.home_main_content.gsub('\"','"')
  end
end
