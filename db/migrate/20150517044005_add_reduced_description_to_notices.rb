class AddReducedDescriptionToNotices < ActiveRecord::Migration
  def change
    add_column :notices, :reduced_description, :text
  end
end
