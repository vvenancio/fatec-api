class AddCorrectIndexToCoursesInternships < ActiveRecord::Migration
  def change
  	add_index :courses_internships, [:course_id, :internship_id], unique: true
  end
end