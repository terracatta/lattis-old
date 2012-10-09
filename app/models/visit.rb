class Visit < ActiveRecord::Base
  has_many :enrollments
  has_many :scans
  has_many :exams

  has_many :stimulation_sessions
  has_many :stimulation_device_sessions, through: :stimulation_sessions
  has_many :stimulations, through: :stimulation_device_sessions

  has_many :tasks, as: :taskable

  belongs_to :subject, counter_cache: true
  belongs_to :study
end
