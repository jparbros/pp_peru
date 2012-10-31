CarrierWave.configure do |config|
  config.storage = (Rails.env.production? ? :fog : :file)
  
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY'],
    :aws_secret_access_key  =>  ENV['AWS_SECRET_ACCESS_KEY']
  }
  config.fog_directory = ENV['AWS_BUCKET']
  config.fog_public    = true
end
