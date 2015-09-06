class RemoveCreatedAtFromNotice < ActiveRecord::Migration
  def change
    remove_column :notices, :created_at, :datetime
  end
end
