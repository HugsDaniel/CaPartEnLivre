class Book < ApplicationRecord
  belongs_to :user
  belongs_to :group

  has_many :comments
  has_many :likes, as: :likable

  serialize :genres, Array

  GENRES = Book.all.map(&:genres).flatten.uniq.prepend("")
  scope :filtered, -> (genre) { where("genres ILIKE ?", "%#{genre}%") }

  mount_uploader :cover, CoverUploader
end
