class CreateDeviceModels < ActiveRecord::Migration
  def change
    create_table :device_models do |t|
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
