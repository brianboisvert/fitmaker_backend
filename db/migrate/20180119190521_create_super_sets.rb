class CreateSuperSets < ActiveRecord::Migration[5.1]
  def change
    create_table :super_sets do |t|
      t.integer :workout_id
      t.string :category
      t.integer :sets

      t.timestamps
    end
  end
end
