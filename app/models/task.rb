class Task < ActiveRecord::Base
  belongs_to :taskable, polymorphic: true
  belongs_to :visit
  belongs_to :subject
  belongs_to :task_type
end
