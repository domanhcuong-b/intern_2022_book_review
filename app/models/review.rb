class Review < ApplicationRecord
  CREATEABLE_ATTRS = %i(rating content book_id).freeze

  belongs_to :user
  belongs_to :book

  validates :content, presence: true
  validates :rating, presence: true,
            numericality: {greater_than_or_equal_to: Settings.book.MIN_RATING,
                           less_than_or_equal_to: Settings.book.MAX_RATING}

  scope :order_by_time_created, ->{order created_at: :desc}
  scope :by_book_id, ->(book_id){where book_id: book_id}
  scope :by_rating, ->(rating){where rating: rating}

  after_save :update_book_rating

  private

  def update_book_rating
    book = Book.find_by id: book_id
    reviews = Review.by_book_id(book_id)
    new_average_rating = (reviews.sum(:rating).to_f / reviews.count).round(1)
    book.update_attribute :average_rating, new_average_rating
  end
end
