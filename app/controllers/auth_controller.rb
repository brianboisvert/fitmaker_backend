class AuthController < ApplicationController

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      render json: {
        id: user.id,
        username: user.username,
        jwt: issue_token(user.id),
        workouts: user.workouts
      }
    else
      render json: {error: 'Not a user: get it together!!!'}, status: 404
    end
  end

  def show
    if current_user
      render json: {
        id: current_user.id,
        username: current_user.username,
        workouts: current_user.workouts
      }
    else
      render json: {error: 'No id present on headers'}, status: 404
    end
  end

end
