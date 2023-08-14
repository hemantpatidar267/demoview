class CreateScreens < ActiveRecord::Migration[7.0]
  def change
    create_table :screens do |t|
      t.integer :seating_capacity
      t.references :theatre, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
