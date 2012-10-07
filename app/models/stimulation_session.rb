class StimulationSession < ActiveRecord::Base
  has_many :stimulation_device_sessions
  belongs_to :visit
  belongs_to :subject, counter_cache: true
  belongs_to :study
  belongs_to :staff
  belongs_to :location
end
