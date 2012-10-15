class StimulationDeviceSession < ActiveRecord::Base
  has_many :stimulations
  has_many :motor_thresholds

  belongs_to :stimulation_session
  belongs_to :tms_stimulator
  belongs_to :tdcs_stimulator
  belongs_to :coil
  belongs_to :subject, counter_cache: true
end
