class StimulationDeviceSession < ActiveRecord::Base
  has_many :stimulations
  belongs_to :stimulation_session
  belongs_to :stimulator
  belongs_to :coil
  belongs_to :subject, counter_cache: true
end
