class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.references :genre, foreign_key: true, null: false

      t.timestamps
    end
  end
end
