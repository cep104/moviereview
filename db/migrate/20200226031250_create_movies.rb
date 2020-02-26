class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :description
      t.belongs_to :genre, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :director, null: false, foreign_key: true

      t.timestamps
    end
  end
end
