class Course < ActiveRecord::Base
	has_and_belongs_to_many :notices
	has_and_belongs_to_many :internships

  validates :name, presence: true
end