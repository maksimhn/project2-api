class Word < ActiveRecord::Base
  has_many :quizzes
  has_many :users, through: :quizzes

  def self.get_random_word
    random_noun = Word.all.sample
    { noun: random_noun.word, gen: random_noun.gender }
  end

end
