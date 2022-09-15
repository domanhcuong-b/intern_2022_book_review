class Picture < ApplicationRecord
  belongs_to :ownership, polymorphic: true

  validates :url, presence: true
  mount_uploader :url, PictureUploader
end
