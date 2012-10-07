class CreateScanFormats < ActiveRecord::Migration
  def change
    create_table :scan_formats do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
