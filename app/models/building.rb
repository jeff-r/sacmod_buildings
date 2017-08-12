class Building < ApplicationRecord
  belongs_to :architect
  has_many :images
  geocoded_by :address
  after_validation :geocode

  def address
    "#{address1}, #{city} #{zip}"
  end

  def needs_geocoding?
    latitude.nil? || longitude.nil?
  end

  def map_center
    [latitude, longitude].join(',')
  end
end
