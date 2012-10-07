class Exam < ActiveRecord::Base
  attr_accessible :date, :pregnancy_test_end_time, :pregnancy_test_lot, :pregnancy_test_start_time, :pregnant, :study_id, :subject_id, :user_id, :visit_id
end
