class RemoveAccessFromNotices < ActiveRecord::Migration
  def change
    remove_column :notices, :access, :integer
  end
end
