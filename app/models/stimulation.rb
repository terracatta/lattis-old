class Stimulation < ActiveRecord::Base
  attr_accessible :brain_area_id, :bursts_per_train, :date, :duration, :frequency, :intensity, :interburst_interval, :interpulse_interval, :intertrain_interval, :neuro_navigation_used, :paired_pulse_intensity, :pulses_per_burst, :pulses_per_train, :sham, :stimulation_device_session_id, :stimulation_session_id, :stimulation_sub_sub_type_id, :stimulation_type_id, :study_id, :subject_id, :trains_count
end
