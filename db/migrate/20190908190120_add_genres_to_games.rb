class AddGenresToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :genres, :string
  end
end
