class Podcast < ApplicationRecord
  belongs_to :group
  belongs_to :user

  GENRES = []
  serialize :genres, Array

  mount_uploader :image, ImageUploader
end
