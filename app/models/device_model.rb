class DeviceModel < ActiveRecord::Base
  attr_accessible :coil_id, :coil_model_id, :device_id, :name, :serial, :stimulator_id, :stimulator_model_id, :type
end
