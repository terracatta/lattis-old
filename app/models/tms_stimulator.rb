class TmsStimulator < Device
  has_many :stimulation_device_sessions
  has_many :motor_thresholds
  belongs_to :tms_stimulator_model
end
