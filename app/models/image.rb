class Image < ApplicationRecord
  mount_uploader :filename, ImageUploader
  before_create :make_image_dir_if_necessary

  belongs_to :building

  def uploaded_image_path
    "#{Rails.root}/public/uploads/images/buildings/#{building.id}"
  end

  def make_image_dir_if_necessary
    FileUtils.mkdir_p uploaded_image_path
  end

  def path
    filename
  end

  def thumb_path
    return "" if filename.thumb.nil?
    filename.thumb.url
  end
end
