class Population < ActiveRecord::Base
  attr_accessible :description, :name
  validates :name, presence: true
end
