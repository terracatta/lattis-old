class ScanFormat < ActiveRecord::Base
  has_many :scans
  validates :name, presence: true
end
