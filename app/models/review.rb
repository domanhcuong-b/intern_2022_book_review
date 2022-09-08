class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :content, presence: true
  validates :rating, presence: true,
            numericality: {greater_than_or_equal_to: Settings.book.MIN_RATING,
                           less_than_or_equal_to: Settings.book.MAX_RATING}

  scope :order_by_time_created, ->{order created_at: :desc}
  scope :by_book_id, ->(book_id){where book_id: book_id}
  scope :by_rating, ->(rating){where rating: rating}
end
