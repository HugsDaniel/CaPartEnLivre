class Game < ApplicationRecord
  belongs_to :group
  belongs_to :user

  has_many :likes, as: :likable

  serialize :genres, Array
  serialize :devs, Array
  serialize :platforms, Array

  GENRES = Game.all.map(&:genres).flatten.uniq.prepend("")
  scope :filtered, -> (genre) { where("genres ILIKE ?", "%#{genre}%") }

  mount_uploader :background_image, BackgroundImageUploader
end
