class CartedExercise < ApplicationRecord
  belongs_to :user
  belongs_to :exercise
  belongs_to :workout, optional: true
end
