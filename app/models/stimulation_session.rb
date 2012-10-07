class StimulationSession < ActiveRecord::Base
  has_many :stimulation_device_sessions
  has_many :motor_thresholds

  belongs_to :visit
  belongs_to :subject, counter_cache: true
  belongs_to :study
  belongs_to :staff, class_name: 'User', foreign_key: 'user_id'
  belongs_to :location
end
