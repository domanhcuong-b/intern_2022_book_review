class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_allowlist
    Settings.image.IMG_EXTENSION_ALLOW
  end

  def size_range
    0..Settings.image.PICTURE_MAX_SIZE.megabytes
  end
end
