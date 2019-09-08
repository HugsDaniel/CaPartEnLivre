class Series < ApplicationRecord
  belongs_to :user
  belongs_to :group

  has_many :likes, as: :likable
  serialize :genres, Array

  GENRES = Series.all.map(&:genres).flatten.uniq.prepend("")
  scope :filtered, -> (genre) { where("genres ILIKE ?", "%#{genre}%") }

  mount_uploader :poster, PosterUploader
end
