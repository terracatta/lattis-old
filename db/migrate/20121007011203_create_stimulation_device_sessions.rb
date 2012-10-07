class CreateStimulationDeviceSessions < ActiveRecord::Migration
  def change
    create_table :stimulation_device_sessions do |t|
      t.integer :stimulation_session_id
      t.integer :stimulator_id
      t.integer :stimulator_model_id
      t.integer :coil_id
      t.integer :coil_model_id
      t.integer :subject_id
      t.integer :study_id
      t.integer :user_id
      t.datetime :date

      t.timestamps
    end
  end
end
