Geocoder.configure(
  lookup: :google, # name of geocoding service (symbol)
  use_https: true, # use HTTPS for lookup requests? (if supported)
  api_key: ENV['GOOGLEMAP'] # API key for geocoding service
)
