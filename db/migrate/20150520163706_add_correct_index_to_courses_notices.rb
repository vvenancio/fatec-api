class AddCorrectIndexToCoursesNotices < ActiveRecord::Migration
  def change
  	add_index :courses_notices, [:course_id, :notice_id], unique: true
  end
end