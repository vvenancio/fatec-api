class Internship < ActiveRecord::Base
  belongs_to :enterprise
  has_and_belongs_to_many :courses
end