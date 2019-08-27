class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
  has_many :memberships
  has_many :groups, through: :memberships
  has_many :likes
  has_many :liked_books, through: :likes, source: :book

  validates :first_name, presence: true

  mount_uploader :avatar, AvatarUploader

  def add_to(group)
    Membership.create(user: self, group: group)
  end

  def likes?(book)
    liked_books.include?(book)
  end
end
