class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :content, presence: true

  scope :newest_to_oldest, ->{order created_at: :desc}
end
