class Book < ApplicationRecord
  has_many :books_authors_relationships, dependent: :destroy
  has_many :authors, through: :books_authors_relationships

  has_many :books_genres_relationships, dependent: :destroy
  has_many :genres, through: :books_genres_relationships

  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews

  has_one :picture, as: :ownership, dependent: :destroy
  accepts_nested_attributes_for :picture

  validates :title, presence: true
  validates :total_pages,
            numericality: {greater_than: Settings.book.MIN_TOTAL_PAGES}
  validates :average_rating, allow_nil: true,
            numericality: {greater_than_or_equal_to: Settings.book.MIN_RATING,
                           less_than_or_equal_to: Settings.book.MAX_RATING}

  delegate :url, to: :picture, prefix: true

  scope :order_by_time_created, ->{order created_at: :desc}
end
