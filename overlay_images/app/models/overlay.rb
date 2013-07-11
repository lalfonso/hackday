class Overlay < ActiveRecord::Base
  attr_accessible :date_from, :date_to, :image, :position, :remote_image_url
  mount_uploader :image, ImageUploader

  POSITIONS = {'Left Top' => 'lt', 'Left Bottom' => 'lb', 'Right Top' => 'rt', 'Right Bottom' => 'rb'}

  def self.current
    where("? BETWEEN date_from AND date_to", Time.now).first
  end

  before_save do |r|
    r.position ||= 'rt'
  end

end
