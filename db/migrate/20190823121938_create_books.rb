class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :authors
      t.string :description
      t.string :published_date
      t.string :image_link
      t.string :read

      t.timestamps
    end
  end
end
