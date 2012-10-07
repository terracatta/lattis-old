class CreatePopulationRosters < ActiveRecord::Migration
  def change
    create_table :population_rosters do |t|
      t.integer :subject_id
      t.integer :population_id

      t.timestamps
    end
  end
end
