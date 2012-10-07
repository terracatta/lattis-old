class Coil < Device
  has_many :stimulation_device_sessions
  has_many :motor_thresholds
  belongs_to :coil_model
end
