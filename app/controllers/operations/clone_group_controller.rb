class Operations::CloneGroupController < ApplicationController
  load_and_authorize_resource :operation, class: Operations::Operation
  load_and_authorize_resource :group, class: Operations::Group, through: :operation

  # POST /groups/1/clone
  def clone
    @new_group = @group.deep_clone include: :slots, except: { slots: :user_id } do |original, group|
      group.order = @operation.groups.size
    end

    authorize! :create, @new_group

    if @new_group.save
      render json: @new_group, status: :created
    else
      render json: @new_group.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def group_params
      params.require(:group).permit()
    end
end
