class Stimulator < Device
  has_many :stimulation_device_sessions
  belongs_to :stimulator_model
end
