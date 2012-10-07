class CreateStimulationSubTypes < ActiveRecord::Migration
  def change
    create_table :stimulation_sub_types do |t|
      t.string :name
      t.integer :stimulation_type_id
      t.float :interpulse_interval
      t.float :interburst_interval
      t.float :intertrain_interval
      t.float :frequency
      t.integer :trains_count
      t.integer :pulses_per_train
      t.integer :bursts_per_train
      t.integer  :pulses_per_burst

      t.timestamps
    end
  end
end
