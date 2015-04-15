class RemoveUpdatedAtFromEnterprise < ActiveRecord::Migration
  def change
    remove_column :enterprises, :updated_at, :datetime
  end
end
