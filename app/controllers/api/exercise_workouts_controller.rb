class Api::ExerciseWorkoutsController < ApplicationController
  def create
    carted_exercises = current_user.carted_exercises.where(status: 'Processing')
    carted_exercises.each do |carted_exercise|
      carted_exercise.status = 'Added'
      exercise_workout = ExerciseWorkout.new(exercise_id: carted_exercise.exercise.id, workout_id: carted_exercise.workout_id)
      exercise_workout.save
    end
   
    workout = Workout.find_by(id: carted_exercise.workout_id)
    workout.status = 'Active'
    workout.save

    redirect_to "/api/workouts/#{exercise_workout.workout_id}"
  end

  def destroy
    
  end
end