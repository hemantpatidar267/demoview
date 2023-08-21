class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :alphanumeric_id
      t.integer :number_of_tickets
      t.references :user, null: false, foreign_key: true
      t.references :theatre, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
