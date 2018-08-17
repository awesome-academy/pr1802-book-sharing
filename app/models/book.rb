class Book < ApplicationRecord
  belongs_to :user
  has_one :source, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :book_categories
  has_many :categories, through: :book_categories
  has_many :author, through: :book_authors
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :description, presence: true, length: {maximum: 800}
  validate :picture_size

  private

  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
