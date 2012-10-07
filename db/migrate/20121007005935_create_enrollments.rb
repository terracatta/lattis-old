class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :study_id
      t.integer :user_id
      t.integer :subject_id
      t.integer :visit_id
      t.date :enrollment_start_date
      t.date :enrollment_end_date
      t.string :enrollment_status
      t.text :enrollment_status_comment

      t.timestamps
    end
  end
end
