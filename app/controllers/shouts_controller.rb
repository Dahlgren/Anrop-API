class ShoutsController < ApplicationController
  load_and_authorize_resource

  # GET /shouts
  def index
    render json: @shouts
  end

  # GET /shouts/1
  def show
    render json: @shout
  end

  # POST /shouts
  def create
    @shout.user = current_user
    @shout.ip = request.remote_ip

    if @shout.save
      render json: @shout, status: :created, location: @shout
    else
      render json: @shout.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shouts/1
  def update
    if @shout.update(shout_params)
      render json: @shout
    else
      render json: @shout.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shouts/1
  def destroy
    @shout.destroy

    head :no_content
  end

  private
    # Only allow a trusted parameter "white list" through.
    def shout_params
      params.require(:shout).permit(
        :message,
      )
    end
end
