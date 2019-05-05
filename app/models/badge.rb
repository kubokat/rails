class Badge < ApplicationRecord
  RULES = [:category, :level, :attempt]

  has_many :users, through: :user_badges
  has_many :user_badges
end
