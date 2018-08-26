class SharedWorkout < ApplicationRecord
  belongs_to :fit_group, optional: true
  belongs_to :workout
end
