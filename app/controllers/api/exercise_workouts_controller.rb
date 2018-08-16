class Api::ExerciseWorkoutsController < ApplicationController
  def create
    params = {
      exercise_id: ,
      workout_id:
    }
    @exercise_workout = ExerciseWorkout.new(params)
    @exercise_workout.save
  end

  def destroy
    
  end
end