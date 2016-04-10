class Operations::OperationsController < ApplicationController
  load_and_authorize_resource

  # GET /operations
  def index
    render json: @operations.order(start: :desc)
  end

  # GET /operations/upcoming
  def upcoming
    render json: @operations.upcoming.order(start: :asc)
  end

  # GET /operations/1
  def show
    render json: @operation
  end

  # POST /operations
  def create
    @operation.operation_author = current_user.id

    if @operation.save
      render json: @operation, status: :created
    else
      render json: @operation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /operations/1
  def update
    if @operation.update(operation_params)
      render json: @operation
    else
      render json: @operation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /operations/1
  def destroy
    @operation.destroy

    head :no_content
  end

  private
    # Only allow a trusted parameter "white list" through.
    def operation_params
      params.require(:operation).permit(
        :title,
        :text,
        :image,
        :start,
        :hidden,
        :locked,
        :thread_id,
      )
    end
end
