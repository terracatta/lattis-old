class MotorThreshold < ActiveRecord::Base
  belongs_to :coil
  belongs_to :stimulation_session
  belongs_to :stimulator
end
