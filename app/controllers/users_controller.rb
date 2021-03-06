class UsersController < ApplicationController
  # we making an exception for a following before_action
  skip_before_action :authenticate, only: [:login, :create]

  # gets token from User and make sure credentials are permitted
  # sends back some additional information for graphs
  # POST /login
  def login
    credentials = user_credentials
    @user = User.find_by(email: credentials[:email])
    token = User.login(credentials[:email], credentials[:password])
    if token
      render json: { token: token,
                     rate: @user.success_rate_stats,
                     quizzes: @user.total_quizzes_stats,
                     stats: @user.progress_stats,
                     id: @user.id,
                     email: @user.email }
    else
      head :unauthorized
    end
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    render json: @users
  end

  # sends back current user's statistics
  def send_stats
    render json: { rate: user.success_rate_stats,
             stats: quiz.progress_stats,
             quizzes: user.total_quizzes_stats }
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_credentials)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # destroys userdata: user itself and its quizzes
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.reset_contents
    if @user.destroy
      head :ok
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

    # list of credentials we would allow
    def user_credentials
      params.require(:credentials).permit(:email, :password, :password_confirmation)
    end

end
