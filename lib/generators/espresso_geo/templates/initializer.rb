EspressoGeo.configure do |config|
  # defaults to ENV['ESPRESSO_GEO_CONSUMER_KEY']
  config.consumer_key = ENV['ESPRESSO_GEO_CONSUMER_KEY']
  #config.consumer_key = ''

  # Defaults to ENV['ESPRESSO_GEO_CONSUMER_SECRET']
  #config.consumer_secret  = ''
  config.consumer_secret = ENV['ESPRESSO_GEO_CONSUMER_SECRET']

end
