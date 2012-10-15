class CreateVisitStaffRosters < ActiveRecord::Migration
  def change
    create_table :visit_staff_rosters do |t|
      t.integer :staff_id
      t.integer :visit_id

      t.timestamps
    end
  end
end
