class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.date :publication_time
      t.string :title
      t.string :reference
      t.string :picture
      t.text :description
      t.integer :access

      t.timestamps null: false
    end
  end
end
