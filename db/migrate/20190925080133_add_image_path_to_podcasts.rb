class AddImagePathToPodcasts < ActiveRecord::Migration[5.2]
  def change
    add_column :podcasts, :image_path, :string
  end
end
