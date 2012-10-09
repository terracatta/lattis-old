class TdcsStimulation < Stimulation
  has_many :brain_areas, through: :stimulation_brain_areas
  has_many :stimulation_brain_areas

  belongs_to :stimulation_device_session

  belongs_to :tdcs_stimulator
  belongs_to :coil
  belongs_to :subject, counter_cache: true
end
