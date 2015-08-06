class QuizzesController < ApplicationController
  before_action :authenticate, only: [:login, :create]

  # creates a new quiz, connects it to user, sends back renewed stats
  # POST /quizzes
  # POST /quizzes.json
  def create
    user = User.find(params[:id])
    quiz_word = params[:word]
    quiz_result = params[:result]
    quiz_wordid = Word.find_by(word: quiz_word).id
    quiz = Quiz.new(word_id: quiz_wordid, user_id: user.id, result: quiz_result)
    if quiz.save
      render json: { rate: user.success_rate_stats, stats: user.progress_stats, quizzes: user.total_quizzes_stats }
    else
      render json: quiz.errors, status: :unprocessable_entity
    end
  end
end
