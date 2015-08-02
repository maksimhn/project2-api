class Word < ActiveRecord::Base
  has_many :quizzes
  has_many :users, through: :quizzes
end
