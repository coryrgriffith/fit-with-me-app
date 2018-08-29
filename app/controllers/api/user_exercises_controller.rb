class Api::UserExercisesController < ApplicationController
  # creation happens in shared_workouts controller during the "add a workout to a fit group work flow"

  def index
    p params
    @user_exercises = UserExercise.where(user_id: current_user.id).where(fit_group_id: params[:fit_group_id]).where(workout_id: params[:workout_id])
    render "index.json.jbuilder"
  end

  def show
    @user_exercise = UserExercise.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def update
    
  end
end
