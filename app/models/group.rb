class Group < ApplicationRecord
  has_many :books
  has_many :movies
  has_many :games
  has_many :series

  has_many :memberships, inverse_of: :group
  has_many :members, through: :memberships, source: :user

  accepts_nested_attributes_for :memberships

  mount_uploader :image, ImageUploader

  validates :name, :image, presence: true
end
