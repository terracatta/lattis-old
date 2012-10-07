class Subject < ActiveRecord::Base
  attr_accessible :address, :address2, :age, :city, :contactable, :date_of_birth, :ethnicity_id, :first_name, :gender, :handedness, :height, :last_name, :mrn, :phone, :race_id, :scan_sessions_count, :scans_count, :secondary_phone, :stimulation_sessions_count, :stimulations_count, :tms_safe, :tms_safe_comment, :visits_count, :weight, :zipcode
end
