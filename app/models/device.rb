class Device < ActiveRecord::Base
  belongs_to :device_model

  validates :name, presence: true
  validates :serial, presence: true
end
