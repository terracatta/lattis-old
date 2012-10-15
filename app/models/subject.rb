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

  validates :mrn, format: { with: /^(?!0+$)\d{7}$/ }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :gender, presence: true
  validates :ethnicity, presence: true
  validates :race, presence: true


  # Public: Displays a suitable full name for a subject
  #
  # Returns a string of the subject's first name and last name
  def name
    "#{first_name} #{last_name}"
  end

end
