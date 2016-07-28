class SessionsController < ApplicationController
  skip_authorization_check

  def index
    if current_user
      @session = Session.new
      @session.token = current_token
      @session.user = current_user
      render json: @session
    else
      head :forbidden
    end
  end

  def create
    @session = Session.new(session_params)
    if @session.login
      render json: @session
    else
      head :forbidden
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def session_params
      params.require(:session).permit(
        :username,
        :password
      )
    end
end
