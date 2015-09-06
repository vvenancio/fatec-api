class CreateCoursesNotices < ActiveRecord::Migration
  def change
    create_table :courses_notices, id: false do |t|
      t.references :course, index: true, foreign_key: true
      t.references :notice, index: true, foreign_key: true
    end
  end
end
