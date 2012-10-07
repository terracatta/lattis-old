class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.string :type
      t.string :serial
      t.integer :device_id
      t.integer :stimulator_id
      t.integer :coil_id
      t.integer :stimulator_model_id
      t.integer :coil_model_id

      t.timestamps
    end
  end
end
