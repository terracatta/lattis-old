class TmsStimulationType < ActiveRecord::Base
  has_many :tms_stimulations
  has_many :tms_stimulation_sub_types
end
