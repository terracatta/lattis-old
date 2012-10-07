class Coil < Device
  has_many :stimulation_device_sessions
  belongs_to :coil_model
end
