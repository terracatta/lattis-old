class ScanSession < ActiveRecord::Base
  has_many :scans
  belongs_to :visit
  belongs_to :staff, class_name: 'User', foreign_key: :user_id
  belongs_to :subject, counter_cache: true
  belongs_to :location
  belongs_to :study
end
