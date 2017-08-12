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

  def has_address?
    !(address1.empty? || city.empty? || zip.empty?)
  end

  def prev
    architect.buildings.where("id < ?", id).order("id desc").first || architect.buildings.last
  end

  def next
    architect.buildings.where("id > ?", id).order("id asc").first || architect.buildings.first
  end
end
