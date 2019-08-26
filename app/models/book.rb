class Book < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :comments

  mount_uploader :cover, CoverUploader
end
