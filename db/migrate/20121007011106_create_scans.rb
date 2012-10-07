class CreateScans < ActiveRecord::Migration
  def change
    create_table :scans do |t|
      t.integer :visit_id
      t.integer :location_id
      t.integer :study_id
      t.integer :subject_id
      t.integer :scan_session_id
      t.integer :user_id
      t.integer :scan_type_id
      t.integer :scan_sub_type_id
      t.integer :scan_format_id
      t.datetime :date
      t.string :file

      t.timestamps
    end
  end
end
