class MotorThreshold < ActiveRecord::Base
  attr_accessible :coil_id, :date, :determination, :intensity, :stimulation_session_id, :stimulator_id, :variety

  belongs_to :coil
  belongs_to :stimulation_session_id
  belongs_to :stimulator_id

end
