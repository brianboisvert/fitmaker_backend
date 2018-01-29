class SuperSetsController < ApplicationController
  before_action :set_super_set, only: [:show, :update, :destroy]

  # GET /super_sets
  def index
    @super_sets = SuperSet.all

    render json: @super_sets, include: [:exercises]
  end

  # GET /super_sets/1
  def show
    render json: @super_set
  end

  # POST /super_sets
  def create
    @super_set = SuperSet.new(super_set_params)
    if @super_set.save
      render json: @super_set, status: :created, location: @super_set
    else
      render json: @super_set.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /super_sets/1
  def update
    if @super_set.update(super_set_params)
      render json: @super_set
    else
      render json: @super_set.errors, status: :unprocessable_entity
    end
  end

  # DELETE /super_sets/1
  def destroy
    @super_set.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_super_set
      @super_set = SuperSet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def super_set_params
      params.require(:super_set).permit(:workout_id, :category)
    end
end
