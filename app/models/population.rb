class Population < ActiveRecord::Base
  validates :name, presence: true
end
