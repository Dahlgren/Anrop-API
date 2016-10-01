class Users::ShoutsController < ApplicationController
  load_and_authorize_resource :user
  load_and_authorize_resource :shout, through: :user

  # GET /shouts
  def index
    @shouts = @shouts.order(created_at: :desc).limit(20)
    render json: @shouts
  end
end
