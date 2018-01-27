class Operations::SteamWorkshopController < ApplicationController
  load_and_authorize_resource :operation, class: Operations::Operation
  load_and_authorize_resource :steam_workshop, class: Operations::SteamWorkshop, through: :operation

  # GET /steam_workshop
  def index
    render json: @steam_workshops
  end

  # GET /steam_workshop/1
  def show
    render json: @steam_workshop
  end

  # POST /steam_workshop
  def create
    if @steam_workshop.save
      render json: @steam_workshop, status: :created
    else
      render json: @steam_workshop.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /steam_workshop/1
  def update
    if @steam_workshop.update(steam_workshop_params)
      render json: @steam_workshop
    else
      render json: @steam_workshop.errors, status: :unprocessable_entity
    end
  end

  # DELETE /steam_workshop/1
  def destroy
    @steam_workshop.destroy

    head :no_content
  end

  private
    # Only allow a trusted parameter "white list" through.
    def steam_workshop_params
      params.require(:steam_workshop).permit(
        :steam_workshop_id,
      )
    end
end
