class ChangeOwnerCommentTypeInTables < ActiveRecord::Migration[5.2]
  def change
    change_column :books, :owner_comment, :text
    change_column :games, :owner_comment, :text
    change_column :movies, :owner_comment, :text
    change_column :series, :owner_comment, :text
  end
end
