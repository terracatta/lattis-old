class CreateBrainAreas < ActiveRecord::Migration
  def change
    create_table :brain_areas do |t|
      t.string :name
      t.string :short_name
      t.string :hemisphere

      t.timestamps
    end
  end
end
