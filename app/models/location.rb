class Location < ActiveRecord::Base
  has_many :scans
  has_many :stimulations

  validates :name, presence: true
  validates :floor_number, presence: true
  validates :building_name, presence: true

end
