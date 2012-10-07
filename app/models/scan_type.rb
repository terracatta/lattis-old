class ScanType < ActiveRecord::Base
  has_many :scan_sub_types
  has_many :scans

  validates :name, presence: true
end
