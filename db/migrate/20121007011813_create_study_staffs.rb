class CreateStudyStaffs < ActiveRecord::Migration
  def change
    create_table :study_staffs do |t|
      t.integer :study_id
      t.integer :user_id
      t.boolean :is_principle

      t.timestamps
    end
  end
end
