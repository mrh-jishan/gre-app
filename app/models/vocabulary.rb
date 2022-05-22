class Vocabulary < ApplicationRecord
  has_many :vocabulary_maps, :dependent => :destroy
  has_many :vocabulary_sets, :through => :vocabulary_maps
end
