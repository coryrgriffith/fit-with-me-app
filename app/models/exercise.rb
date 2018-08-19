class Exercise < ApplicationRecord
  has_many :images
  has_many :instructions
  has_many :exercise_workouts
  has_many :workouts, through: :exercise_workouts
  has_many :user_exercises
  has_many :carted_exercises
end
