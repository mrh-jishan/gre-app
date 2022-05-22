class CreateVocabularyMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :vocabulary_maps do |t|
      t.belongs_to :vocabulary, null: false, foreign_key: true
      t.belongs_to :vocabulary_set, null: false, foreign_key: true
      t.timestamps
    end
  end
end
