class Enrollment < ActiveRecord::Base
  attr_accessible :enrollment_end_date, :enrollment_start_date, :enrollment_status, :enrollment_status_comment, :study_id, :subject_id, :user_id, :visit_id
end
