class LlamaRanch < ApplicationRecord
  geocoded_by :address, lookup: lambda { |obj| obj.geocoder_lookup }
  reverse_geocoded_by :lat, :long
  after_validation :geocode

  def address
    [street, city, state, country].compact.join(", ")
  end

  def geocoder_lookup
    if country_code == "RU" || "TR"
      :yandex
    elsif country_code == "CN"
      :baidu
    else
      :google
    end
  end
end
