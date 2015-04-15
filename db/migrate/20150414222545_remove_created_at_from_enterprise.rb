class RemoveCreatedAtFromEnterprise < ActiveRecord::Migration
  def change
    remove_column :enterprises, :created_at, :datetime
  end
end
