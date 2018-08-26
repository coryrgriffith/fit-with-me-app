class Api::SharedWorkoutsController < ApplicationController
  def create
    fit_group = FitGroup.find_by(status: 'Adding Workout')
    shared_workout = SharedWorkout.new(workout_id: params[:id], fit_group_id: fit_group.id)
    shared_workout.status = 'Pending'
    shared_workout.save

    # create action for user_exercises
    users_in_group = fit_group.users
    workout = Workout.find_by(id: params[:id])

    users_in_group.each do |user|
      workout.exercises.each do |exercise|
        user_exercise = UserExercise.new(
          user_id: user.id,
          fit_group_id: fit_group.id,
          workout_id: shared_workout.workout_id,
          exercise_id: exercise.id,
          completed: 'Incomplete'
        )
        user_exercise.save
      end
    end

    shared_workout.status = 'Active'
    fit_group.status = 'Active'
    shared_workout.save
    fit_group.save
  end
end
