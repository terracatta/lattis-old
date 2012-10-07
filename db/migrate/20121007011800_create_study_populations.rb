class CreateStudyPopulations < ActiveRecord::Migration
  def change
    create_table :study_populations do |t|
      t.integer :population_id
      t.integer :study_id

      t.timestamps
    end
  end
end
