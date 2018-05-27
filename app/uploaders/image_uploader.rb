class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "#{Rails.root}/public/uploads/images/buildings/#{model.building_id}"
  end

  # Process files as they are uploaded:
  process resize_to_limit: [500, 500]

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fit: [50, 50]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def size_range
    0..10.megabytes
  end
end
