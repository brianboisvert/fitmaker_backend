class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :update, :destroy]

  # GET /workouts
  def index
    if current_user
      @workouts = Workout.all
      render json: @workouts, include: [:users]
      # render json: current_user.workouts
    end
  end

  # GET /workouts/1
  def show
    render json: @workout, include: [:users]
  end

  # def new
  #   @workout = Workout.new
  # end

  # POST /workouts
  def create
    # byebug;

    @workout = Workout.new(workout_params)

    # params[:workout][:sets].each do |set|
    #   @workout.sets.build(number: set[:number], exercies: set[:exercises])
    # end

    if @workout.save
      current_user.workouts << @workout

      render json: @workout, status: :created, location: @workout
    else
      render json: @workout.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /workouts/1
  # def update
  #    @workout = Workout.find(params[:id])
  #    @workout.update(workout_params)
  #    if @workout.save
  #      render json: @workout
  #    else
  #      render json: @WorkoutList.errors, status: :unprocessable_entity
  #    end
  # end

  def update
    if @workout.update(workout_params)
      render json: @workout
    else
      render json: @workout.errors, status: :unprocessable_entity
    end
  end

  # DELETE /workouts/1
  def destroy
    @workout.destroy

    if @workout.destroy
      @workouts = Workout.all
      render json: @workouts
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout
      @workout = Workout.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def workout_params
      params.require(:workout).permit(:title, :description, :intensity, :duration, :category, :id)
    end

end
