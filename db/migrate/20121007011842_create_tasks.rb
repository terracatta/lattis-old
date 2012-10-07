class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :subject_id
      t.integer :visit_id
      t.integer :task_type_id

      t.timestamps
    end
  end
end
