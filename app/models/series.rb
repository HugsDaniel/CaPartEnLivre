class Series < ApplicationRecord
  belongs_to :user
  belongs_to :group

  has_many :likes, as: :likable
  serialize :genres, Array

  mount_uploader :poster, PosterUploader
end
