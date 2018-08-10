class Workout < ApplicationRecord
  has_many :shared_workouts
  has_many :fit_groups, through: :shared_workouts
  has_many :exercise_workouts
  has_many :exercises, through: :exercise_workouts
end
