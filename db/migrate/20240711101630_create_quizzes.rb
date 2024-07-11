class CreateQuizzes < ActiveRecord::Migration[7.1]
  def change
    create_table :quizzes do |t|
      t.text :body, null: false
      t.string :answer, null: false
      t.integer :offset, null: false

      t.timestamps
    end
  end
end
