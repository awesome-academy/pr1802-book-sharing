class Book < ApplicationRecord
  belongs_to :user
  has_one :source, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :book_categories, dependent: :destroy
  has_many :categories, through: :book_categories
  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors
  validates :user_id, presence: true
  validates :description, presence: true, length: {maximum: 800}
  validate :picture_size

  mount_uploaders :pictures, PictureUploader
  serialize :pictures, JSON

  # General scope
  scope :newest_to_oldest, ->{order created_at: :desc}
  # static_pages/home scope
  scope :recently_published, ->{order(created_at: :desc).limit 6}
  # search/index scope
  scope :by_title, ->(name){where "name like '%#{name}%'"}
  scope :by_author_ids, ->(author_ids) do
    joins(:book_authors).where "author_id IN (?)", author_ids
  end
  scope :by_category_ids, ->(category_ids) do
    joins(:book_categories).where "category_id IN (?)", category_ids
  end
  # books/index scope
  scope :find_feed, ->(following_ids){where "user_id IN (?)", following_ids}

  def average_rating
    return 0 if ratings.blank?

    ratings.sum(:score) / ratings.size
  end

  private

  # Validates the size of an uploaded picture.
  def picture_size
    pictures.each do |picture|
      if picture.size > 5.megabytes
        errors.add :picture, t(".picture_size_error")
      end
    end
  end
end
