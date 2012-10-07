class Scan < ActiveRecord::Base
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
