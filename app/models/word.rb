class Word < ActiveRecord::Base
  has_many :quizzes
  has_many :users, through: :quizzes

  def self.get_random_word
    Word.all.sample
  end

end
