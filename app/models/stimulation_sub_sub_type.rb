class StimulationSubSubType < ActiveRecord::Base
  attr_accessible :bursts_per_train, :frequency, :interburst_interval, :interpulse_interval, :intertain_interval, :name, :pulses_per_train, :stimulation_sub_type_id, :trains_count
end
