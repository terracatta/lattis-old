class Subject < ActiveRecord::Base
  has_many :stimulations
  has_many :stimulation_types, through: :stimulations, uniq: true
  has_many :stimulation_sub_types, through: :stimulations, uniq: true
  has_many :stimulation_sub_sub_types, through: :stimulations, uniq: true
  has_many :stimulation_device_sessions
  has_many :stimulation_sessions

  has_many :scans
  has_many :scan_types, through: :scans, uniq: true
  has_many :scan_sub_types, through: :scans, uniq: true
  has_many :scan_sessions

  has_many :exams
  has_many :visits

  has_many :studies, through: :enrollments
  has_many :enrollments

  has_many :populations, through: :population_rosters
  has_many :population_rosters

  has_many :task_types, through: :tasks, uniq: true
  has_many :tasks

  belongs_to :ethnicity
  belongs_to :race
end
