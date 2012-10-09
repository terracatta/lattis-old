class TmsStimulationSubType < ActiveRecord::Base
  has_many :tms_stimulation_sub_sub_types
  belongs_to :tms_stimulation_type
end
