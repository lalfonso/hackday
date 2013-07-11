class Overlay < ActiveRecord::Base
  attr_accessible :date_from, :date_to, :image, :position
  scope :current, where("? BETWEEN date_from AND date_to", Time.now).first
  
  mount_uploader :image, ImageUploader

  validates_presence_of :date_from, :date_to, :position, :image
  validate :check_dates

  POSITIONS = %w(lt lb rt rb)

  def check_dates
    if date_from > date_to || date_from == date_to 
      errors.add(:date_from, t("overlay.wrong_dates")) 
    end
  end

end
