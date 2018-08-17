class Api::WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all
    render "index.json.jbuilder"
  end

  def show
    @workout = Workout.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def create
    workout_params = {
      name: params[:name],
      target_goal: params[:target_goal]
    }
    @workout = Workout.new(workout_params)
    @workout.save
  end

  def update
    
  end

  def destroy
    
  end
end
