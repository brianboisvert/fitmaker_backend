class ExerciseSet < ApplicationRecord
  belongs_to :exercise
  belongs_to :super_set
end
