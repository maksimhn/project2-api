class User < ActiveRecord::Base
  has_secure_password

  has_many :quizzes
  has_many :words, through: :quizzes

  # makes sure set_token gets called before creation
  before_create :set_token

  # ensures email's uniqueness on AR level
  validates :email, uniqueness: true

  # login action that happens when we login (we call User.logn(email, pass))
  def self.login(email, password)
    user = find_by email: email
    user.login password if user
  end

  # returning a token if all the previous actions of the chain ended successfully
  def login(password)
    authenticate(password) && set_token && save! && token
  end

  def success_rate_stats
    hits = Float(self.quizzes.where(:result => true).length)
    total_quizzes = Float(self.quizzes.length)
    rate = hits / total_quizzes
    rate.round(2) * 100
  end

  def total_quizzes_stats
    Float(self.quizzes.length)
  end

  def progress_stats
    word_count = Float(Word.all.length)
    quizzed_count = Float(Quiz.all.uniq { |noun| noun.word_id }.length)
    rate = quizzed_count / word_count
    rate.round(2) * 100
  end

  def reset_contents
    self.quizzes.destroy_all
  end


  private

  def set_token
    # make it random with 16 (default) URL-safe characters
    self.token = SecureRandom.hex
  end
end
