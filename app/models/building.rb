class Building < ApplicationRecord
  belongs_to :architect
  has_many :images
  geocoded_by :address
  after_validation :geocode

  def address
    "#{address1}, #{city} #{zip}"
  end
end
