class RemovingIndexFromCoursesInternships < ActiveRecord::Migration
  def change
  	remove_index :courses_internships, :column => :course_id
  	remove_index :courses_internships, :column => :internship_id
  end
end