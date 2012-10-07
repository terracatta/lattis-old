class StudyStaff < ActiveRecord::Base
  belongs_to :study
  belongs_to :staff, class_name: 'User'
end
