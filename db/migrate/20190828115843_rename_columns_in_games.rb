class RenameColumnsInGames < ActiveRecord::Migration[5.2]
  def change
    rename_column :games, :published_at, :released
    rename_column :games, :platform, :platforms
    rename_column :games, :company, :devs
    add_column :games, :background_image, :string
  end
end
