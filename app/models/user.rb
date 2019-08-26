class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
  has_many :memberships
  has_many :groups, through: :memberships

  validates :first_name, presence: true

  mount_uploader :avatar, AvatarUploader

  def add_to(group)
    Membership.create(user: self, group: group)
  end
end
