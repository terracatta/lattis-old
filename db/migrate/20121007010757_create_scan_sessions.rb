class CreateScanSessions < ActiveRecord::Migration
  def change
    create_table :scan_sessions do |t|
      t.integer :visit_id
      t.integer :user_id
      t.integer :subject_id
      t.integer :location_id
      t.integer :study_id
      t.datetime :date

      t.timestamps
    end
  end
end
