class TmsStimulatorModel < DeviceModel
  has_many :tms_stimulators
  has_many :stimulation_device_sessions
end
