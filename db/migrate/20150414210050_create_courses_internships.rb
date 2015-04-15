class CreateCoursesInternships < ActiveRecord::Migration
  def change
    create_table :courses_internships, id: false do |t|
      t.references :course, index: true, foreign_key: true
      t.references :internship, index: true, foreign_key: true
    end
  end
end
