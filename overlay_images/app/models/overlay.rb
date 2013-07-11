class Overlay < ActiveRecord::Base
  attr_accessible :date_from, :date_to, :image, :position, :remote_image_url
  mount_uploader :image, ImageUploader

  POSITIONS = %w(lt lb rt rb)
end
