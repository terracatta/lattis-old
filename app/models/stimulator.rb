class Stimulator < Device
  has_many :stimulation_device_sessions
  has_many :motor_thresholds
  belongs_to :stimulator_model
end
