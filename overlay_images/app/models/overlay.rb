class Overlay < ActiveRecord::Base
  attr_accessible :date_from, :date_to, :image, :position

  POSITIONS = %w(UL UR BL BR)

  scope :current, where("? BETWEEN date_from AND date_to", Time.now).first

end
