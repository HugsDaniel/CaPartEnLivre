class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :overview
      t.string :release_date
      t.string :original_title
      t.string :poster_path
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
