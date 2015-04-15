class RemoveCreatedAtFromInternship < ActiveRecord::Migration
  def change
    remove_column :internships, :created_at, :datetime
  end
end
