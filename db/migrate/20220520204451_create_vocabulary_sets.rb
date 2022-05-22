class CreateVocabularySets < ActiveRecord::Migration[6.1]
  def change
    create_table :vocabulary_sets do |t|
      t.belongs_to :study_plan, null: false, foreign_key: true
      t.string :set_name

      t.timestamps
    end
  end
end
