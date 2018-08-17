class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book
  scope :order_sort, -> { order created_at: :desc }
  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :content, presence: true
end
