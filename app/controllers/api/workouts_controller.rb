class Api::WorkoutsController < ApplicationController
  def index
    # while on a specific Fit Group Page
    if params[:filtered] == 'true'
      @workouts = Workout.where(id: SharedWorkout.where(fit_group_id: FitGroup.find_by(id: params[:id])))
    else 
    # while looking at all existing workouts 
      @workouts = Workout.all
    end
    render "index.json.jbuilder"
  end

  def show
    puts params
    @workout = Workout.find_by(id: params[:id])
    puts @workout
    puts @workout.id
    render "show.json.jbuilder"
  end

  def create
    carted_exercises = current_user.carted_exercises.where(status: 'Carted')
    workout_params = {
      name: params[:name],
      target_goal: params[:target_goal],
      status: 'Pending'
    }
    workout = Workout.new(workout_params)
    workout.save

    carted_exercises.each do |carted_exercise|
      carted_exercise.status = 'Processing'
      carted_exercise.workout_id = workout.id
      carted_exercise.save
    end
    redirect_to '/api/exercise_workouts'
  end

  def update
    
  end

  def destroy
    
  end
end
