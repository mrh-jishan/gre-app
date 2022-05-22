class StudyPlan < ApplicationRecord
  belongs_to :user
  has_many :vocabulary_sets
end
