class Api::CartedExercisesController < ApplicationController
  def index
    @carted_exercises = current_user.carted_exercises.where(status: 'Carted')
    render "index.json.jbuilder"
  end

  def show
    
  end

  def create
    @carted_exercise = CartedExercise.new(
      user_id: current_user.id,
      exercise_id: params[:exercise_id],
      workout_id: params[:id],
      status: "Carted"
    )
    @carted_exercise.save
    render "index.json.jbuilder"
  end

  def destroy
    
  end
end
