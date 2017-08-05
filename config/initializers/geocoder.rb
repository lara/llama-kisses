# config/initializers/geocoder.rb
Geocoder.configure(
  timeout: 2,

  cache: Redis.new,

  ip_lookup: :maxmind,
)
