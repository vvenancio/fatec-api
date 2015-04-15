class CreateInternships < ActiveRecord::Migration
  def change
    create_table :internships do |t|
      t.date :publication_time
      t.references :enterprise, index: true, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.text :requirements
      t.integer :semester
      t.text :benefits
      t.integer :access
      t.text :observation

      t.timestamps null: false
    end
  end
end
