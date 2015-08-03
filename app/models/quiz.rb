class Quiz < ActiveRecord::Base
  belongs_to :user
  belongs_to :word

  def progress_stats
    word_count = Float(Word.all.length)
    quizzed_count = Float(Quiz.all.uniq { |noun| noun.word_id }.length)
    rate = quizzed_count / word_count
    rate.round(4) * 100
  end

  def create
    quiz = Quiz.new(quiz_params)
    if quiz.save
      render { rate: user.success_rate_stats, stats: quiz.progress_stats }
    else
      render json: quiz.errors, status: :unprocessable_entity
    end
  end

end
