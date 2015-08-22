class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer, defaults: 0
  end
end
