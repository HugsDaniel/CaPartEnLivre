class Book < ApplicationRecord
  belongs_to :user
  belongs_to :group

  has_many :comments
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  mount_uploader :cover, CoverUploader
end
