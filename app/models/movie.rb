class Movie < ApplicationRecord
  belongs_to :group
  belongs_to :user

  mount_uploader :poster, PosterUploader
end
