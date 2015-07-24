class User < ActiveRecord::Base
  has_secure_password

  # makes sure set_token gets called before creation
  before_create :set_token

  # ensures email's uniqueness on AR level
  validates :email, uniqueness: true

  private

  def set_token
    # make it random with 16 (default) URL-safe characters
    self.token = SecureRandom.hex
  end
end
