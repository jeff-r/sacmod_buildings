class Architect < ApplicationRecord
  has_many :buildings

  def prev
    Architect.where("id < ?", id).order("id desc").first || Architect.last
  end

  def next
    Architect.where("id > ?", id).first || Architect.first
  end
end
