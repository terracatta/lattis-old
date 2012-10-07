class CreateScanSubTypes < ActiveRecord::Migration
  def change
    create_table :scan_sub_types do |t|
      t.string :name
      t.text :description
      t.integer :scan_type_id

      t.timestamps
    end
  end
end
