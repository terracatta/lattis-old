class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :building_name
      t.string :floor_number
      t.string :room_string
      t.string :key_number
      t.string :phone

      t.timestamps
    end
  end
end
