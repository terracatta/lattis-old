class Location < ActiveRecord::Base
  has_many :scans
  has_many :stimulations
end
