class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :content, presence: true
  validates :rating, presence: true,
            numericality: {greater_than_or_equal_to: Settings.book.MIN_RATING,
                           less_than_or_equal_to: Settings.book.MAX_RATING}
end
