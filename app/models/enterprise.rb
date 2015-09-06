class Enterprise < ActiveRecord::Base
	has_many :internships

  validates :fantasy_name, presence: true
  validates :corporate_name, presence: true
end
