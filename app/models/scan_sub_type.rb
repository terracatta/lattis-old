class ScanSubType < ActiveRecord::Base
  belongs_to :scan_type

  validates :name, presence: true
end
