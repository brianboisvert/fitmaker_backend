class CreateExerciseSets < ActiveRecord::Migration[5.1]
  def change
    create_table :exercise_sets do |t|
      t.integer :super_set_id
      t.integer :exercise_id
      t.integer :duration

      t.timestamps
    end
  end
end
