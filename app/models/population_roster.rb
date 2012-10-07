class PopulationRoster < ActiveRecord::Base
  belongs_to :population
  belongs_to :subject
end
