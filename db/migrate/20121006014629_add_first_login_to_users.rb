class AddFirstLoginToUsers < ActiveRecord::Migration
  def change
    add_column :users, :welcomed, :boolean, default: false
  end
end
