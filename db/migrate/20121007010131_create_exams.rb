class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.integer :visit_id
      t.integer :subject_id
      t.boolean :pregnant
      t.integer :user_id
      t.string :pregnancy_test_lot
      t.integer :study_id
      t.datetime :pregnancy_test_start_time
      t.datetime :pregnancy_test_end_time
      t.date :date

      t.timestamps
    end
  end
end
