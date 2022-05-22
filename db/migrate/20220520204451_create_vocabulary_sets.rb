class CreateVocabularySets < ActiveRecord::Migration[6.1]
  def change
    create_table :vocabulary_sets do |t|
      t.belongs_to :study_plan, null: false, foreign_key: true
      t.string :set_name, null: false
      t.boolean :is_completed, null: false, default: false

      t.timestamps
    end
  end
end
