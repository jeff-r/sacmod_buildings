class Image < ApplicationRecord
  mount_uploader :filename, ImageUploader
  before_create :make_image_dir_if_necessary

  belongs_to :building

  def make_image_dir_if_necessary
    FileUtils.mkdir_p uploaded_image_path
  end

  def path
    filename
  end

  def image_dir
    "/uploads/images/buildings/#{building.id}"
  end

  def uploaded_image_path
    "#{Rails.root}/public#{image_dir}"
  end

  def thumb_path
    return "" if filename.thumb.nil?
    filename.thumb.url
  end

  def path_for_size(max_size)
    basename     = File.basename(filename_in_database)
    sized_path   = "#{image_dir}/x#{max_size}_#{basename}"
    file_on_disk = "#{Rails.root}/public#{sized_path}"
    if File.exist?(file_on_disk)
      sized_path
    else
      "#{image_dir}/#{filename_in_database}"
    end
  end
end
