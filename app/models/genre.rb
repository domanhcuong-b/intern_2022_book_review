class Genre < ApplicationRecord
  has_many :books_genres_relationships, dependent: :destroy
  has_many :books, through: :books_genres_relationships

  validates :name, presence: true
end
