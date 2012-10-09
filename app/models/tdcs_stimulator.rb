class TdcsStimulator < Device
  has_many :stimulation_device_sessions
  belongs_to :tdcs_stimulator_model
end
