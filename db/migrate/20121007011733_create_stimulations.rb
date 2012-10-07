class CreateStimulations < ActiveRecord::Migration
  def change
    create_table :stimulations do |t|
      t.datetime :date
      t.integer :subject_id
      t.integer :study_id
      t.integer :stimulation_type_id
      t.integer :stimulation_sub_type_id
      t.integer :stimulation_sub_sub_type_id
      t.integer :stimulation_device_session_id
      t.integer :stimulation_session_id
      t.boolean :sham
      t.integer :brain_area_id
      t.float :intensity
      t.float :paired_pulse_intensity
      t.integer :frequency
      t.float :interpulse_interval
      t.float :interburst_interval
      t.float :intertrain_interval
      t.integer :trains_count
      t.integer :pulses_per_train
      t.integer :bursts_per_train
      t.integer :pulses_per_burst
      t.float :duration
      t.boolean :neuro_navigation_used

      t.timestamps
    end
  end
end
