class UserFitGroup < ApplicationRecord
  belongs_to :fit_group
  belongs_to :user
end
