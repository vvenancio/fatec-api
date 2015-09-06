class RemoveAccessFromInternships < ActiveRecord::Migration
  def change
    remove_column :internships, :access, :integer
  end
end
