class ElementUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :save_content_type_and_size_in_model

  def save_content_type_and_size_in_model
    model.content_type = file.content_type if model.respond_to?('content_type=') && file.content_type
    model.file_size = file.size  if model.respond_to?('file_size=')
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:

  version :icon, :if => :image? do
    process resize_to_fit: [32, 32]
  end

  version :thumb, :if => :image? do
     process resize_to_fit: [64, 64]
  end

  version :small, :if => :image? do
    process resize_to_fit: [320, 240]
  end

  version :medium, :if => :image? do
    process resize_to_fit: [1280 , 720]
  end

  version :large, :if => :image? do
    process resize_to_fit: [1920, 1080]
  end

  version :large_4k, :if => :image? do
    process resize_to_fit: [4096, 2160]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end


  def image?(new_file=nil)
    if new_file
      new_file.content_type&.start_with? 'image'
    else
      model.content_type&.start_with? 'image'
    end

  end

  def image_or_doc_url
    if model.content_type&.start_with? 'image'
      # TODO : adapt limit size to smaller if smaller
      self.url(:small)
    else
      self.url
    end

  end
end
