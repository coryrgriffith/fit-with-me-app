class Captain < ApplicationRecord
  has_many :fit_groups
  belongs_to :user
end
