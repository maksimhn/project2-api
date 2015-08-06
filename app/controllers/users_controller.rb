class UsersController < ApplicationController
  # we making an exception for a following before_action
  skip_before_action :authenticate, only: [:login, :create]

  # we get token from User class (?) and make sure credentials are permitted
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
                     id: @user.id }
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

  # GET /users/1
  # GET /users/1.json
  def show
    # render json: @user
  end

  def send_stats
    render json: { rate: user.success_rate_stats,
             stats: quiz.progress_stats,
             quizzes: user.total_quizzes_stats }
  end

  def reset_score
    @user = User.find(params[:id])
    if @user.reset_contents
      head :ok
    else
      render json: user.errors, status: :unprocessable_entity
    end
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

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    # @user = User.find(params[:id])

    # if @user.update(user_params)
    #   head :no_content
    # else
    #   render json: @user.errors, status: :unprocessable_entity
    # end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    # @user.destroy

    # head :no_content
  end

  private

    # list of credentials we would allow
    def user_credentials
      params.require(:credentials).permit(:email, :password, :password_confirmation)
    end

end
