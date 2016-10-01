class ApplicationController < ActionController::API
  include ActionController::Helpers
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include CanCan::ControllerAdditions

  check_authorization

  before_action :authenticate_user

  helper_method :current_token
  helper_method :current_user

  def current_token
    authenticate_with_http_token do |token, options|
      token
    end
  end

  def current_user
    @current_user
  end

  def authenticate_user
    @current_user = nil

    # Try to read user token
    token = current_token
    return unless token

    # Make sure expiration is still valid
    user_id, expiration, hash = token.split('.')
    return unless expiration.to_i > Time.now.to_i

    # Try to find user
    user = User.find_by(id: user_id)
    return unless user

    # Match hash in cookie with computed hash for user
    if hash == user.authenticate_hash(expiration)
      @current_user = user
    end
  end
end
