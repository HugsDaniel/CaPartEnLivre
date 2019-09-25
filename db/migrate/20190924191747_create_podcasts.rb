class CreatePodcasts < ActiveRecord::Migration[5.2]
  def change
    create_table :podcasts do |t|
      t.string :image
      t.string :genres
      t.string :title
      t.text :description
      t.string :publisher
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :owner_grade
      t.text :owner_comment

      t.timestamps
    end
  end
end
