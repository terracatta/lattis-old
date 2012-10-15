class AdverseEvent < ActiveRecord::Base
  attr_accessible :date, :enrollment_id, :event_description, :related, :serious, :unexpected
end
