class Notice < ActiveRecord::Base
  has_and_belongs_to_many :courses

  validates :title, presence: true
  validates :publication_time, presence: true
  validates :description, presence: true
  validates :reduced_description, presence: true
  validates :courses, presence: true
end
