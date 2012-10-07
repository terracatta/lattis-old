class Task < ActiveRecord::Base
  attr_accessible :subject_id, :task_type_id, :visit_id
end
