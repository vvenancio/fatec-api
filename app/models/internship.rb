class Internship < ActiveRecord::Base
  belongs_to :enterprise
  has_and_belongs_to_many :courses

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :publication_time, presence: true
  validates :requirements, presence: true
  validates :benefits, presence: true
  validates :courses, presence: true
end
