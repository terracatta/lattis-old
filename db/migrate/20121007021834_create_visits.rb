class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.datetime :date
      t.integer :subject_id
      t.integer :study_id

      t.timestamps
    end
  end
end
