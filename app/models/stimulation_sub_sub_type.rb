class StimulationSubSubType < ActiveRecord::Base
  has_many :stimulations
  belongs_to :stimulation_sub_type
end
