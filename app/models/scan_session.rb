class ScanSession < ActiveRecord::Base
  attr_accessible :location_id, :subject_id, :user_id, :visit_id
end
