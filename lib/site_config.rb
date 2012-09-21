class SiteConfig
  
  def self.method_missing method_name, *args
    @@instance ||= Configurable.first
    if @@instance.respond_to? method_name
      @@instance.send(method_name, *args)
    else
      super
    end
  end
  
end