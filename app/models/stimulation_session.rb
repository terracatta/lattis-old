class StimulationSession < ActiveRecord::Base
  attr_accessible :cnbs_staff_used, :date, :location_id, :neuro_navigation_used, :study_id, :subject_id, :user_id, :visit_id
end
