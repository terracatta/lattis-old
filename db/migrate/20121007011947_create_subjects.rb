class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :secondary_phone
      t.string :address
      t.string :address2
      t.string :city
      t.string :zipcode
      t.date :date_of_birth
      t.string :mrn
      t.integer :ethnicity_id
      t.integer :race_id
      t.string :handedness
      t.boolean :tms_safe
      t.text :tms_safe_comment
      t.integer :visits_count
      t.integer :scan_sessions_count
      t.integer :scans_count
      t.integer :stimulation_sessions_count
      t.integer :stimulations_count
      t.integer :age
      t.string :gender
      t.boolean :contactable
      t.string :height
      t.string :weight

      t.timestamps
    end
  end
end
