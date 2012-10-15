class TmsStimulation < Stimulation
  has_many :brain_areas, through: :stimulation_brain_areas
  has_many :stimulation_brain_areas

  belongs_to :stimulation_device_session
  belongs_to :tms_stimulation_type
  belongs_to :tms_stimulation_sub_type
  belongs_to :tms_stimulation_sub_sub_type
  belongs_to :tms_stimulator
  belongs_to :coil
  belongs_to :subject, counter_cache: true
end
