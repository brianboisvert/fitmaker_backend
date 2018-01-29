class Workout < ApplicationRecord
  has_many :user_workouts
  has_many :users, through: :user_workouts

  has_many :super_sets
  has_many :exercise_sets, through: :super_sets
  has_many :exercises, through: :super_sets
end
