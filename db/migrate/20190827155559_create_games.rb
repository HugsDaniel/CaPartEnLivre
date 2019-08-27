class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.string :description
      t.string :platform
      t.string :published_at
      t.string :company
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
