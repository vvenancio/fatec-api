class RemoveUpdatedAtFromInternship < ActiveRecord::Migration
  def change
    remove_column :internships, :updated_at, :datetime
  end
end
