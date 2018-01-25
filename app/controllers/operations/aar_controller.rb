class Operations::AarController < ApplicationController
  load_and_authorize_resource :operation, class: Operations::Operation
  load_and_authorize_resource :aar, class: Operations::Aar, through: :operation

  # GET /aar
  def index
    render json: @aars
  end

  # GET /aar/1
  def show
    render json: @aar
  end

  # POST /aar
  def create
    if @aar.save
      render json: @aar, status: :created
    else
      render json: @aar.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /aar/1
  def update
    if @aar.update(aar_params)
      render json: @aar
    else
      render json: @aar.errors, status: :unprocessable_entity
    end
  end

  # DELETE /aar/1
  def destroy
    @aar.destroy

    head :no_content
  end

  private
    # Only allow a trusted parameter "white list" through.
    def aar_params
      params.require(:aar).permit(
        :aar_id,
      )
    end
end
