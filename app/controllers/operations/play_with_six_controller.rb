class Operations::PlayWithSixController < ApplicationController
  load_and_authorize_resource :operation, class: Operations::Operation
  load_and_authorize_resource :play_with_six, class: Operations::PlayWithSix, through: :operation

  # GET /play_with_six
  def index
    render json: @play_with_sixes
  end

  # GET /play_with_six/1
  def show
    render json: @play_with_six
  end

  # POST /play_with_six
  def create
    if @play_with_six.save
      render json: @play_with_six, status: :created
    else
      render json: @play_with_six.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /play_with_six/1
  def update
    if @play_with_six.update(play_with_six_params)
      render json: @play_with_six
    else
      render json: @play_with_six.errors, status: :unprocessable_entity
    end
  end

  # DELETE /play_with_six/1
  def destroy
    @play_with_six.destroy

    head :no_content
  end

  private
    # Only allow a trusted parameter "white list" through.
    def play_with_six_params
      params.require(:play_with_six).permit(
        :name,
      )
    end
end
