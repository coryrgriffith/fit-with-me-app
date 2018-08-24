class Api::WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all
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
