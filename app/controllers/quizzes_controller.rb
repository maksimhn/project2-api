class QuizzesController < ApplicationController

  # POST /quizzes
  # POST /quizzes.json
  def create
    quiz_word = headers[:word]
    quiz_result = headers[:result]
    quiz_wordid = Word.find_by(word: quiz_word).id
    quiz = Quiz.new(word_id: quiz_wordid, user_id: user.id, result: quiz_result)
    if quiz.save
      render { rate: user.success_rate_stats, stats: quiz.progress_stats }
    else
      render json: quiz.errors, status: :unprocessable_entity
    end
  end

end
