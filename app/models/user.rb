class User < ApplicationRecord
  has_secure_password
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :user_fit_groups
  has_many :fit_groups, through: :user_fit_groups
end
