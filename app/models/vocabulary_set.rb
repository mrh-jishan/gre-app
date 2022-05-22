class VocabularySet < ApplicationRecord
  belongs_to :study_plan
  has_many :vocabulary_maps, :dependent => :destroy
  has_many :vocabularies, :through => :vocabulary_maps
end
