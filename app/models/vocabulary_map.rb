class VocabularyMap < ApplicationRecord
  belongs_to :vocabulary
  belongs_to :vocabulary_set
end
