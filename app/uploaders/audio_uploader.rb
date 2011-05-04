# encoding: utf-8

class AudioUploader < CarrierWave::Uploader::Base
  #storage :fog
  storage :s3

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def cache_dir
    "#{RAILS_ROOT}/tmp/uploads"
  end
end
