class DeviceModel < ActiveRecord::Base
  has_many :devices
  validates :name, presence: true
end
