class Course < ActiveRecord::Base
	has_and_belongs_to_many :notices, dependent: :destroy
	has_and_belongs_to_many :internships, dependent: :destroy

  validates :name, presence: true
  validates :abreviation, presence: true
end
