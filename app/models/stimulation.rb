class Stimulation < ActiveRecord::Base
  has_many :brain_areas, through: :stimulation_brain_areas
  has_many :stimulation_brain_areas
  has_many :tasks, as: :taskable

  belongs_to :stimulation_device_session
  belongs_to :stimulation_type
  belongs_to :stimulation_sub_type
  belongs_to :stimulation_sub_sub_type
  belongs_to :stimulator
  belongs_to :coil
  belongs_to :subject, counter_cache: true
end
