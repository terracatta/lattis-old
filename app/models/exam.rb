class Exam < ActiveRecord::Base
  belongs_to :visit
  belongs_to :subject
  belongs_to :staff, class_name: 'User'
  belongs_to :study
end
