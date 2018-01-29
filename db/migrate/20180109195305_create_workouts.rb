class CreateWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :workouts do |t|
      t.string :title
      t.text :description
      t.string :intensity
      t.integer :duration
      t.string :category

      t.timestamps
    end
  end
end
