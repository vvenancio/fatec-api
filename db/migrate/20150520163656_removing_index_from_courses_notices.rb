class RemovingIndexFromCoursesNotices < ActiveRecord::Migration
  def change
  	remove_index :courses_notices, :column => :course_id
  	remove_index :courses_notices, :column => :notice_id
  end
end