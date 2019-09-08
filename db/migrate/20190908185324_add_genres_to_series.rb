class AddGenresToSeries < ActiveRecord::Migration[5.2]
  def change
    add_column :series, :genres, :string
  end
end
