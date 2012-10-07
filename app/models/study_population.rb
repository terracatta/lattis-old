class StudyPopulation < ActiveRecord::Base
  belongs_to :study
  belongs_to :population
end
