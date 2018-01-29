
class AuthController < ApplicationController

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      render json: {
        id: user.id,
        username: user.username,
        jwt: issue_token(user.id),
        workouts: user.workouts.map{|workout| serialize(workout)}
      }
    else
      render json: {error: 'Not a user: get it together!!!'}, status: 404
    end
  end

  def show
    workoutData = current_user.workouts.map do |workout|
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


    if current_user
      render json: {
        id: current_user.id,
        username: current_user.username,
        workouts: workoutData
      }
    else
      render json: {error: 'No id present on headers'}, status: 404
    end
  end

  def signup
    user = User.find_by(username: params[:username])
      if user
        render json: {error: 'User already exists!'}, status: 401
      else
        user = User.create(email: params[:email], username: params[:username], password: params[:password])
      end

    if user && user.authenticate(params[:password])
      render json: {
        id: user.id,
        username: user.username,
        jwt: issue_token(user.id),
        workouts: user.workouts.map{|workout| serialize(workout)}
      }
    else
      render json: {error: 'Not a user: get it together!!!'}, status: 404
    end
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
