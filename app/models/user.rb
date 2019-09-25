class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :books
  has_many :memberships
  has_many :groups, through: :memberships
  has_many :likes
  has_many :liked_books, through: :likes, source: :likable, source_type: "Book"
  has_many :liked_movies, through: :likes, source: :likable, source_type: "Movie"
  has_many :liked_series, through: :likes, source: :likable, source_type: "Series"
  has_many :liked_games, through: :likes, source: :likable, source_type: "Game"
  has_many :liked_podcasts, through: :likes, source: :likable, source_type: "Podcast"

  validates :first_name, presence: true

  mount_uploader :avatar, AvatarUploader

  def add_to(group)
    Membership.create(user: self, group: group)
  end

  def likes?(resource)
    if resource.class == Book
      liked_books.include?(resource)
    elsif resource.class == Movie
      liked_movies.include?(resource)
    elsif resource.class == Game
      liked_games.include?(resource)
    elsif resource.class == Series
      liked_series.include?(resource)
    elsif resource.class == Podcast
      liked_podcasts.include?(resource)
    end
  end
end
