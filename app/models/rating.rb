class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :user_id, presence: true, uniqueness: true
  validates :book_id, presence: true, uniqueness: true

  after_save :update_average_rating
  def update_average_rating
    average_rating = book.ratings.sum(:score) / book.ratings.size
    book.update average_rating: average_rating
  end
end
