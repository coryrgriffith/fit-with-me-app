class Image < ApplicationRecord
  belongs_to :exercise, optional: true
  belongs_to :user, optional: true
end
