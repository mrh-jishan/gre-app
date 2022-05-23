class StudyPlan < ApplicationRecord
  belongs_to :user
  has_many :vocabulary_sets, :dependent => :destroy
  has_many :vocabularies, :through => :vocabulary_sets, :dependent => :destroy
end
