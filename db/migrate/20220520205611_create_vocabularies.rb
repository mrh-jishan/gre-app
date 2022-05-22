class CreateVocabularies < ActiveRecord::Migration[6.1]
  def change
    create_table :vocabularies do |t|
      t.string :base_word
      t.string :translation
      t.string :synonym
      t.text :description

      t.timestamps
    end
  end
end
