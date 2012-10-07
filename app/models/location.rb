class Location < ActiveRecord::Base
  attr_accessible :building_name, :floor_number, :key_number, :name, :phone, :room_string
end
