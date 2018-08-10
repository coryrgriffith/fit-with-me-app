class SharedWorkout < ApplicationRecord
  belongs_to :fit_group
  belongs_to :workout
end
