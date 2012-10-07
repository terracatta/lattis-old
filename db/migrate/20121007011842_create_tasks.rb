class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :subject_id
      t.integer :visit_id
      t.integer :task_type_id
      t.integer :taskable_id
      t.string  :taskable_type

      t.timestamps
    end
  end
end
