class StimulationType < ActiveRecord::Base
  has_many :stimulations
  has_many :stimulation_sub_types
end
