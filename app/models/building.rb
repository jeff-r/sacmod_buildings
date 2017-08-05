class Building < ApplicationRecord
  belongs_to :architect
  has_many :images

  def address
    "#{address1}, #{city} #{zip}"
  end
end
