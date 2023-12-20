class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.integer :score
      t.text :review
      t.references :user, foreign_key: true, null: false
      t.references :movie, foreign_key: true, null: false

      t.timestamps
    end
  end
end
