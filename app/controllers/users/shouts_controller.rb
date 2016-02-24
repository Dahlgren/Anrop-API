class Users::ShoutsController < ApplicationController
  # GET /shouts
  def index
    @user = User.find(params[:user_id])
    @shouts = @user.shouts
    render json: @shouts
  end
end
