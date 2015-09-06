class AddTitleToInternships < ActiveRecord::Migration
  def change
    add_column :internships, :title, :string
  end
end
