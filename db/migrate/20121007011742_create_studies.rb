class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.string :irb_number
      t.text :description
      t.boolean :repository_approved

      t.timestamps
    end
  end
end
