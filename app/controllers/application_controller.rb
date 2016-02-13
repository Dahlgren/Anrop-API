class ApplicationController < ActionController::API
  include ActionController::Helpers
  include ActionController::Cookies

  before_action :authenticate_user

  def authenticate_user
    @current_user = nil

    # Try to read user cookie
    user_cookie = cookies[:fusionGppEM_user]
    return unless user_cookie

    # Make sure expiration is still valid
    user_id, expiration, hash = user_cookie.split('.')
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
