class Movie < ApplicationRecord
  belongs_to :group
  belongs_to :user

  has_many :likes, as: :likable
  serialize :genres, Array

  GENRES = Movie.all.map(&:genres).flatten.uniq.prepend("")
  scope :filtered, -> (genre) { where("genres ILIKE ?", "%#{genre}%") }

  mount_uploader :poster, PosterUploader
end
