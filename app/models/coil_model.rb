class CoilModel < DeviceModel
  has_many :coils
  has_many :stimulation_device_sessions
end
