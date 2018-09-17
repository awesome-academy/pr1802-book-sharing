class Book < ApplicationRecord
  belongs_to :user
  has_one :source, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :book_categories
  has_many :categories, through: :book_categories
  has_many :book_authors
  has_many :authors, through: :book_authors
  scope :order_sort, -> { order created_at: :desc }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :description, presence: true, length: {maximum: 800}
  validate :picture_size

  scope :recently_published, ->{order(created_at: :desc).limit 6}
  scope :by_title, ->(name){where "name like '%#{name}%'"}
  scope :by_author_ids, ->(author_ids) do
    joins(:book_authors).where "author_id IN (?)", author_ids
  end
  scope :by_category_ids, ->(category_ids) do
    joins(:book_categories).where "category_id IN (?)", category_ids
  end
  scope :find_feed, ->(following_ids){where "user_id IN (?)", following_ids}

  def average_rating
    return 0 if ratings.blank?

    ratings.sum(:score) / ratings.size
  end

  private

  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
