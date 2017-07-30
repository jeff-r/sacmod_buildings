class Image < ApplicationRecord
  mount_uploader :filename, ImageUploader

  belongs_to :building

  def self.uploaded_image_path
    "#{Rails.root}/public/uploads/images/"
  end

  def path
    filename
  end

  def thumb_path
    return "" if filename.thumb.nil?
    filename.thumb.url
  end
end
