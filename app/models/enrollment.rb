class Enrollment < ActiveRecord::Base
  belongs_to :staff
  belongs_to :subject
  belongs_to :study, class_name: 'User'
  belongs_to :visit
end
