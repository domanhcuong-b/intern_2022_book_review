class User < ApplicationRecord
  has_many :active_relationships, class_name: UsersRelationship.name,
           foreign_key: :follower_id, dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships, class_name: UsersRelationship.name,
           foreign_key: :followed_id, dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :reviews, dependent: :nullify
  has_many :books, through: :reviews

  has_one :picture, as: :ownership, dependent: :destroy
  accepts_nested_attributes_for :picture

  enum role: {user: 0, admin: 1}

  validates :name, presence: true,
            length: {maximum: Settings.user.NAME_MAX_LENGTH}
  validates :email, presence: true,
            length: {minimum: Settings.user.EMAIL_MIN_LENGTH,
                     maximum: Settings.user.EMAIL_MAX_LENGTH},
            format: {with: Settings.user.VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}
  validates :password, presence: true, allow_nil: true,
            length: {minimum: Settings.user.PASSWORD_MIN_LENGTH}

  has_secure_password
end
