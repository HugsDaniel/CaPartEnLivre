class AddImdbUrlToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :imdb_url, :string
  end
end
