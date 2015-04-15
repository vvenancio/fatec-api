class CreateEnterprises < ActiveRecord::Migration
  def change
    create_table :enterprises do |t|
      t.string :fantasy_name
      t.string :corporate_name
      t.string :site

      t.timestamps null: false
    end
  end
end
