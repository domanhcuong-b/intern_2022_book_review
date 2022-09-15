class Book < ApplicationRecord
  # CREATEABLE_ATTRS = %i(title total_pages description
  #   picture_attributes: [:url]).freeze
  BOOK_PARAMS = [:title, :total_pages, :description,
                 picture_attributes: [:url],
                 authors_attributes: [:author_id, :name],
                 genre_ids: [],
                 books_genres_relationships_attributes: [:id, :book_id, :genre_id],
                 author_ids: [],
                 books_authors_relationships_atrributes: [:id, :book_id, :author_id]].freeze

  has_many :books_authors_relationships, dependent: :destroy
  has_many :authors, through: :books_authors_relationships

  has_many :books_genres_relationships, dependent: :destroy
  has_many :genres, through: :books_genres_relationships

  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews

  has_one :picture, as: :ownership, dependent: :destroy
  accepts_nested_attributes_for :picture
  # accepts_nested_attributes_for :authors
  # accepts_nested_attributes_for :genres
  accepts_nested_attributes_for :books_authors_relationships
  accepts_nested_attributes_for :books_genres_relationships

  validates :title, presence: true
  validates :total_pages, allow_nil: true,
            numericality: {greater_than: Settings.book.MIN_TOTAL_PAGES}
  validates :average_rating, allow_nil: true,
            numericality: {greater_than_or_equal_to: Settings.book.MIN_RATING,
                           less_than_or_equal_to: Settings.book.MAX_RATING}

  delegate :url, to: :picture, prefix: true, allow_nil: true

  scope :order_by_time_created, ->{order created_at: :desc}
  scope :by_title, (lambda do |input_text|
    where("title like ?", "%#{input_text}%") if input_text.present?
  end)
  scope :by_genre, (lambda do |genre_id|
    joins(:genres).where(genres: {id: genre_id}) if genre_id.present?
  end)
end
