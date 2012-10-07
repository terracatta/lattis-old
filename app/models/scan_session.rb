class ScanSession < ActiveRecord::Base
  attr_accessible :location_id, :subject_id, :user_id, :visit_id
  has_many :scans
  belongs_to :visit
  belongs_to :staff, class_name: 'User'
  belongs_to :subject, counter_cache: true
  belongs_to :location
  belongs_to :study
end
