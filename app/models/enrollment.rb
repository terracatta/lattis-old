class Enrollment < ActiveRecord::Base
  belongs_to :staff, class_name: 'User', foreign_key: :user_id
  belongs_to :subject
  belongs_to :study
  belongs_to :visit
end
