class Users::SearchController < ApplicationController
  load_and_authorize_resource :user

  # GET /users
  def index
    if params[:q]
      @users = User.search(params[:q])
      render json: @users
    else
      render status: 422
    end
  end
end
