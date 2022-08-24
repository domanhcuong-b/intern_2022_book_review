class Picture < ApplicationRecord
  belongs_to :ownership, polymorphic: true

  validates :url, presence: true
end
