class AddGroupToBooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :group, foreign_key: true
  end
end
