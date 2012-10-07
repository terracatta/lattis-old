class CreateMotorThresholds < ActiveRecord::Migration
  def change
    create_table :motor_thresholds do |t|
      t.string :variety
      t.integer :stimulator_id
      t.integer :coil_id
      t.float :intensity
      t.string :determination
      t.integer :stimulation_session_id
      t.datetime :date

      t.timestamps
    end
  end
end
