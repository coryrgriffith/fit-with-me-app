class Api::ExerciseWorkoutsController < ApplicationController
  def create
    p '*' * 50
    p 'in exercise_workout create'
    p '*' * 50
    @carted_exercises = current_user.carted_exercises.where(status: 'Processing')
    @carted_exercises.each do |carted_exercise|
      carted_exercise.status = 'Added'
      exercise_workout = ExerciseWorkout.new(exercise_id: carted_exercise.exercise.id, workout_id: carted_exercise.workout.id)
      carted_exercise.save
      exercise_workout.save
    end
   
    # @workout = Workout.find_by(id: @carted_exercise.workout_id) START HERE
    @workout.status = 'Active'
    @workout.save

    redirect_to "/api/workouts/#{workout['id']}"
  end

  def destroy
    
  end
end