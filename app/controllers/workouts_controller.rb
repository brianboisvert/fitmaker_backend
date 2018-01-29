class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :update, :destroy]


  # GET /workouts
  def index
    if current_user
      @workouts = Workout.all
      render json: serialize(@workouts)
    end
  end

  # GET /workouts/1
  def show
    render json: serialize(@workouts)
  end

  # POST /workouts
  def create
    @workout = Workout.new(
      title: params[:title],
      intensity: params[:intensity],
      category: params[:category],
      description: params[:description]
    )

    if @workout.save
      params[:sets].each do |my_set|
        set_object = SuperSet.create(workout: @workout, category: my_set[:category], sets: my_set[:times])
        my_set[:exercises].each do |ex|
          @newExercise = Exercise.find_or_create_by(name: ex[:name], description: ex[:description])
          @newExercise.super_sets << set_object
        end
      end

      current_user.workouts << @workout

      render json: serialize(@workout), status: :created, location: @workout
    else
      render json: @workout.errors, status: :unprocessable_entity
    end
  end

  def update
    if @workout.update(
        title: params[:title],
        intensity: params[:intensity],
        category: params[:category],
        description: params[:description]
      )

        params[:sets].each do |my_set|
          if my_set["id"]
            set = SuperSet.find(my_set["id"])
            set.update(category: my_set["category"], sets: my_set["times"])
            my_set["exercises"].each do |ex|
              if ex["id"]
                exercise = Exercise.find(ex["id"])
                exercise.update(name: ex["name"], description: ex["description"])
                ex_set = ExerciseSet.find_by(super_set_id: set.id, exercise_id: exercise.id)
                ex_set.update(duration: ex["duration"])
              else
                exercise = Exercise.create(name: ex["name"], description: ex["description"])
                ExerciseSet.create(super_set: set, exercise: exercise, duration: ex["duration"])
              end
            end
          else
            set = SuperSet.create(workout: @workout, category: my_set["category"], sets: my_set["times"])
            my_set["exercises"].each do |ex|
                exercise = Exercise.create(name: ex["name"], description: ex["description"])
                ExerciseSet.create(super_set: set, exercise: exercise, duration: ex["duration"])
              end
          end
        end
        render json: serialize(@workout), status: :updated, location: @workout
      else
        render json: @workout.errors, status: :unprocessable_entity
    end
  end

  # DELETE /workouts/1
  def destroy
    @workout.destroy
    if @workout.destroy
      @workouts = current_user.workouts
      render json: serialize(@workout)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout
      @workout = Workout.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def workout_params
      params.require(:workout).permit(:title, :description, :intensity, :duration, :category, :id, :users, :sets)
    end

    def serialize(workout)
      {
        info: workout,
        super_sets: workout.super_sets.map do |super_set|
            {
              info: super_set,
              exercises: super_set.exercise_sets.map do |exercise_set|
                  {
                    info: exercise_set.exercise,
                    duration: exercise_set.duration
                  }
              end
            }
        end
      }
    end

end
