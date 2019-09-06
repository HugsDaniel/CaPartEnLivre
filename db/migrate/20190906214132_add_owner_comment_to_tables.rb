class AddOwnerCommentToTables < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :owner_comment, :string
    add_column :movies, :owner_comment, :string
    add_column :series, :owner_comment, :string
    add_column :games, :owner_comment, :string
  end
end
