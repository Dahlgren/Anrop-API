class Operations::SlotsController < ApplicationController
  load_and_authorize_resource :operation, class: Operations::Operation
  load_and_authorize_resource :group, class: Operations::Group, through: :operation
  load_and_authorize_resource :slot, class: Operations::Slot, through: :group

  # GET /slots
  def index
    render json: @slots.order(:order)
  end

  # GET /slots/1
  def show
    render json: @slot
  end

  # POST /slots
  def create
    if @slot.save
      render json: @slot, status: :created
    else
      render json: @slot.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /slots/1
  def update
    if @slot.update(slot_params)
      render json: @slot
    else
      render json: @slot.errors, status: :unprocessable_entity
    end
  end

  # DELETE /slots/1
  def destroy
    @slot.destroy

    head :no_content
  end

  private
    # Only allow a trusted parameter "white list" through.
    def slot_params
      params.require(:slot).permit(
        :name,
        :order,
        :user_id,
      )
    end
end
