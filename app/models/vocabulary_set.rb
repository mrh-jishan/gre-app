class VocabularySet < ApplicationRecord
  belongs_to :study_plan
  has_many :vocabulary_maps, :dependent => :destroy
  has_many :vocabularies, :through => :vocabulary_maps

  accepts_nested_attributes_for :vocabulary_maps, allow_destroy: true, reject_if: :all_blank
end
