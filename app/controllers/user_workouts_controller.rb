class UserWorkoutsController < ApplicationController
  before_action :set_user_workout, only: [:show, :update, :destroy]

  # GET /user_workouts
  def index
    @user_workouts = UserWorkout.all

    render json: @user_workouts
  end

  # GET /user_workouts/1
  def show
    render json: @user_workout
  end

  # POST /user_workouts
  def create
    @user_workout = UserWorkout.new(user_workout_params)

    if @user_workout.save
      render json: @user_workout, status: :created, location: @user_workout
    else
      render json: @user_workout.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_workouts/1
  def update
    if @user_workout.update(user_workout_params)
      render json: @user_workout
    else
      render json: @user_workout.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_workouts/1
  def destroy
    @user_workout.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_workout
      @user_workout = UserWorkout.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_workout_params
      params.require(:user_workout).permit(:user_id, :workout_id)
    end
end
