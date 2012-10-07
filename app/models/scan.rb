class Scan < ActiveRecord::Base
  attr_accessible :date, :file, :location_id, :scan_format_id, :scan_sub_type_id, :scan_type_id, :study_id, :subject_id, :user_id, :visit_id

  has_many :tasks, as: :taskable
  belongs_to :visit
  belongs_to :subject, counter_cache: true
  belongs_to :study
  belongs_to :location
  belongs_to :scan_type
  belongs_to :scan_sub_type
  belongs_to :scan_format
  belongs_to :scan_session
end
