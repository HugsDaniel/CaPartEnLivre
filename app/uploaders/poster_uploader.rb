class PosterUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
