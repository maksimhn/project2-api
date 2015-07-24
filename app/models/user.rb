class User < ActiveRecord::Base
  has_secure_password

  # makes sure set_token gets called before creation
  before_create :set_token

  # ensures email's uniqueness on AR level
  validates :email, uniqueness: true

  # login action that happens
  def self.login(email, password)
    user = find_by email: email
    # if user is found and password passed to 'authenticate' method returns us user (look 'authenticate' method for details) we just have a user in 'user' variable, not 'nil'. If user hasn't been found we won't go further
    user = user.authenticate password if user
    # upon login we create and save new token to the user to kick other machine's authentication out if we logged in from a new machine
    user.set_token && user.save! if user
    # returns token if such user has been found
    user.token if user
  end

  def set_token
    # make it random with 16 (default) URL-safe characters
    self.token = SecureRandom.hex
  end
end
