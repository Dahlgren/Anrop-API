class Operations::GroupsController < ApplicationController
  load_and_authorize_resource :operation, class: Operations::Operation
  load_and_authorize_resource :group, class: Operations::Group, through: :operation

  # GET /groups
  def index
    render json: @groups
  end

  # GET /groups/1
  def show
    render json: @group
  end

  # POST /groups
  def create
    if @group.save
      render json: @group, status: :created
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /groups/1
  def update
    if @group.update(group_params)
      render json: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /groups/1
  def destroy
    @group.destroy

    head :no_content
  end

  private
    # Only allow a trusted parameter "white list" through.
    def group_params
      params.require(:group).permit(
        :name,
        :order,
      )
    end
end
