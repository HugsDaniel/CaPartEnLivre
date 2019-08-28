class AddLikesCountToTables < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :likes_count, :integer, default: 0
    add_column :movies, :likes_count, :integer, default: 0
    add_column :series, :likes_count, :integer, default: 0
    add_column :games, :likes_count, :integer, default: 0
  end
end
