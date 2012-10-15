class TdcsStimulatorModel < DeviceModel
  has_many :tdcs_stimulators
  has_many :stimulation_device_sessions
end
