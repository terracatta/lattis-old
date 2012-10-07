class Visit < ActiveRecord::Base
  has_many :enrollments
  has_many :scans
  has_many :exams
  has_many :stimulations

  belongs_to :subject, counter_cache: true
  belongs_to :study
end
