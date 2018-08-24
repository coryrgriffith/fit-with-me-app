class FitGroup < ApplicationRecord
  has_many :user_fit_groups
  has_many :users, through: :user_fit_groups
  has_many :shared_workouts
  has_many :workouts, through: :shared_workouts
  belongs_to :captain, optional: true
  has_many :user_exercises
end
