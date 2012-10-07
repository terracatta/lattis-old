class StimulatorModel < DeviceModel
  has_many :stimulators
  has_many :stimulation_device_sessions
end
