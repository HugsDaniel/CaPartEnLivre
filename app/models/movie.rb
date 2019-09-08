class Movie < ApplicationRecord
  belongs_to :group
  belongs_to :user

  has_many :likes, as: :likable
  serialize :genres, Array

  mount_uploader :poster, PosterUploader
end
