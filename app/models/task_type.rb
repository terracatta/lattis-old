class TaskType < ActiveRecord::Base
  has_many :subjects, through: :tasks
  has_many :tasks
end
