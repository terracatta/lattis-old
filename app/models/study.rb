class Study < ActiveRecord::Base
  has_many :subjects, through: :enrollments
  has_many :enrollments

  has_many :staff, through: :study_staff, class_name: 'User'
  has_many :study_staff

  has_many :populations, through: :study_populations
  has_many :study_populations

  has_many :visits
  has_many :stimulation_sessions
  has_many :stimulation_device_sessions
  has_many :stimulations
  has_many :scan_sessions
  has_many :scans
  has_many :exams
end
