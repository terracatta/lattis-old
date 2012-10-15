class TmsStimulationSubSubType < ActiveRecord::Base
  has_many :tms_stimulations
  belongs_to :tms_stimulation_sub_type
end
