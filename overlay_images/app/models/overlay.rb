class Overlay < ActiveRecord::Base
  attr_accessible :date_from, :date_to, :image, :position, :description
  scope :current, where("? BETWEEN date_from AND date_to", Time.now).first
  
  mount_uploader :image, ImageUploader

  validates_presence_of :date_from, :date_to, :position, :image
  validate :check_dates

  POSITIONS = {'Left Top' => 'lt', 'Left Bottom' => 'lb', 'Right Top' => 'rt', 'Right Bottom' => 'rb'}

  def check_dates
  if !date_to.nil? && !date_from.nil?     
    errors.add(:date_from, "can't be later than 'Date to'") if date_from > date_to 
  end
  
  end

  def self.current
    where("? BETWEEN date_from AND date_to", Time.now).first
  end

  before_save do |r|
    r.position ||= 'rt'
  end

end
