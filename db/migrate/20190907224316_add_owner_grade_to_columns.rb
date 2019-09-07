class AddOwnerGradeToColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :owner_grade, :integer
    add_column :movies, :owner_grade, :integer
    add_column :games, :owner_grade, :integer
    add_column :series, :owner_grade, :integer
  end
end
