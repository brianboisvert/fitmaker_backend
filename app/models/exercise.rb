class Exercise < ApplicationRecord
  has_many :exercise_sets
  has_many :super_sets, through: :exercise_sets
end
