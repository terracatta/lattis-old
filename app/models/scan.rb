class Scan < ActiveRecord::Base
  attr_accessible :date, :file, :location_id, :scan_format_id, :scan_sub_type_id, :scan_type_id, :study_id, :subject_id, :user_id, :visit_id
end
