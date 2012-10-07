class BrainArea < ActiveRecord::Base
  has_many :stimulations

  validates :hemisphere, presence: true
  validates :name, presence: true
  validates :short_name, presence: true
end
