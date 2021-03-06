Geocoder.configure(
  lookup: :google,                     # name of geocoding service (symbol)
  api_key: ENV['GOOGLE_MAP_API_KEY'],  # API key for geocoding service
  timeout: 3,                          # geocoding service timeout (secs)
  use_https: true,                     # use HTTPS for lookup requests? (if supported)
  language: :en,                       # ISO-639 language code
  cache: {},                           # cache object (must respond to #[], #[]=, and #del)
  cache_prefix: 'geocoder:',           # prefix (string) to use for all cache keys
  units: :mi,                          # :km for kilometers or :mi for miles
  distances: :linear                   # :spherical or :linear
)
