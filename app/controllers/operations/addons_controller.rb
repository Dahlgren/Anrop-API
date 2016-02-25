class Operations::AddonsController < ApplicationController
  load_and_authorize_resource :operation, class: Operations::Operation
  load_and_authorize_resource :addon, class: Operations::Addon, through: :operation

  # GET /addons
  def index
    render json: @addons
  end

  # GET /addons/1
  def show
    render json: @addon
  end

  # POST /addons
  def create
    if @addon.save
      render json: @addon, status: :created
    else
      render json: @addon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /addons/1
  def update
    if @addon.update(addon_params)
      render json: @addon
    else
      render json: @addon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /addons/1
  def destroy
    @addon.destroy

    head :no_content
  end

  private
    # Only allow a trusted parameter "white list" through.
    def addon_params
      params.require(:addon).permit(
        :name,
        :url,
      )
    end
end
