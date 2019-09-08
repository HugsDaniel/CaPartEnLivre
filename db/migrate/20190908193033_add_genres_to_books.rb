class AddGenresToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :genres, :string
  end
end
