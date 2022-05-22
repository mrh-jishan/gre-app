class Vocabulary < ApplicationRecord

  validates_presence_of :base_word, :translation

  has_many :vocabulary_maps, :dependent => :destroy
  has_many :vocabulary_sets, :through => :vocabulary_maps

end
