class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "#{Rails.root}/public/uploads/images/buildings/#{model.building_id}"
  end

  # Process files as they are uploaded:
  process resize_to_limit: [2000, 2000]

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fit: [50, 50]
  end

  version :x1000 do
    process resize_to_limit: [1000, 1000]
  end

  version :x500 do
    process resize_to_limit: [500, 500]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def size_range
    1..10.megabytes
  end
end
