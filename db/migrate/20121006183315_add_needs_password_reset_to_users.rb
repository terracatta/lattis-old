class AddNeedsPasswordResetToUsers < ActiveRecord::Migration
  def change
    add_column :users, :needs_password_reset, :boolean, default: true
  end
end
