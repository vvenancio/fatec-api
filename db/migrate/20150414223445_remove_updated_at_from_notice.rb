class RemoveUpdatedAtFromNotice < ActiveRecord::Migration
  def change
    remove_column :notices, :updated_at, :datetime
  end
end
