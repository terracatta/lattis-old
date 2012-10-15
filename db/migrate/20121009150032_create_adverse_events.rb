class CreateAdverseEvents < ActiveRecord::Migration
  def change
    create_table :adverse_events do |t|
      t.integer :enrollment_id
      t.datetime :date
      t.text :event_description
      t.boolean :related
      t.boolean :serious
      t.boolean :unexpected

      t.timestamps
    end
  end
end
