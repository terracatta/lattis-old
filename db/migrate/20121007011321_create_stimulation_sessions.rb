class CreateStimulationSessions < ActiveRecord::Migration
  def change
    create_table :stimulation_sessions do |t|
      t.integer :visit_id
      t.integer :location_id
      t.integer :study_id
      t.integer :user_id
      t.integer :subject_id
      t.datetime :date
      t.boolean :neuro_navigation_used
      t.boolean :cnbs_staff_used

      t.timestamps
    end
  end
end
