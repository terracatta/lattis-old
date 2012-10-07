class CreateStimulationTypes < ActiveRecord::Migration
  def change
    create_table :stimulation_types do |t|
      t.string :name
      t.float :interpulse_interval
      t.float :interburst_interval
      t.float :intertain_interval
      t.float :frequency
      t.integer :trains_count
      t.integer :pulses_per_train
      t.integer :bursts_per_train

      t.timestamps
    end
  end
end
