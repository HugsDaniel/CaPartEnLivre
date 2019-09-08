class Book < ApplicationRecord
  belongs_to :user
  belongs_to :group

  has_many :comments
  has_many :likes, as: :likable

  serialize :genres, Array

  mount_uploader :cover, CoverUploader
end
