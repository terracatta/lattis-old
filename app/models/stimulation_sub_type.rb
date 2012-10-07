class StimulationSubType < ActiveRecord::Base
  has_many :stimulation_sub_sub_types
  belongs_to :stimulation_type
end
