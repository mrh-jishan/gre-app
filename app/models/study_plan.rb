class StudyPlan < ApplicationRecord
  belongs_to :user
  has_many :vocabulary_sets
  has_many :vocabularies, :through => :vocabulary_sets

  #.includes(:vocabulary_sets, :vocabularies)
  # scope :quizzes, -> { joins(:vocabulary_sets, :vocabularies).where("vocabulary_sets.is_completed = ?", true) }
end
