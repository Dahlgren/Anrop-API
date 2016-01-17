class OperationsController < ApplicationController
  before_action :set_operation, only: [:show]

  # GET /operations
  def index
    @operations = Operation.all

    render json: @operations
  end

  # GET /operations/1
  def show
    render json: @operation
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operation
      @operation = Operation.find(params[:id])
    end
end
