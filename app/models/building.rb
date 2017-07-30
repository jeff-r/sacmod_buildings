class Building < ApplicationRecord
  belongs_to :architect
  has_many :images
end
