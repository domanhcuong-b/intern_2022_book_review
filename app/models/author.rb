class Author < ApplicationRecord
  has_many :books_authors_relationships, dependent: :destroy
  has_many :books, through: :books_authors_relationships

  validates :name, presence: true
end
