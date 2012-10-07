class MotorThreshold < ActiveRecord::Base
  attr_accessible :coil_id, :date, :determination, :intensity, :stimulation_session_id, :stimulator_id, :variety
end
