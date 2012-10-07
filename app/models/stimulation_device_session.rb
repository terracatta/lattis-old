class StimulationDeviceSession < ActiveRecord::Base
  attr_accessible :coil_id, :coil_model_id, :date, :stimulation_session_id, :stimulator_id, :stimulator_model_id, :study_id, :subject_id, :user_id
end
