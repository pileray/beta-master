class CreateQuizCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :quiz_categories do |t|
      t.references :quiz, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
    add_index :quiz_categories, [:quiz_id, :category_id], unique: true
  end
end
