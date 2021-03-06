class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.boolean :result
      t.references :user, index: true, foreign_key: true
      t.references :word, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
