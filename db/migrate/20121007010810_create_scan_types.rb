class CreateScanTypes < ActiveRecord::Migration
  def change
    create_table :scan_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
