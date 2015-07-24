class ApplicationController < ActionController::API

  # requires authentication before pretty much any action on any model
  before_action :authenticate

  attr_reader :current_user

  private

  # long method extracts info from the header that comes from the front-end. If it's empty, it returns 401 back. Otherwise it sets the current user for the session
  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      @current_user = User.find_by token: token
    end
  end

end
