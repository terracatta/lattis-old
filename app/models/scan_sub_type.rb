class ScanSubType < ActiveRecord::Base
  belongs_to :scan_type

  validates :name, presence: true
  validates :scan_type, presence: true
end
