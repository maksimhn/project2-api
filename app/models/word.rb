class Word < ActiveRecord::Base
  has_many :quizzes
  has_many :users, through: :quizzes

  # returns a random word from the pool
  def self.get_random_word
    Word.all.sample
  end
end
