class AddEnrollmentsCountToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :enrollments_count, :integer
  end
end
