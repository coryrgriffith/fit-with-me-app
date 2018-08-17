class UserExercise < ApplicationRecord
  belongs_to :user
  belongs_to :fit_group
  belongs_to :workout
  belongs_to :exercise
end
