class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :content, presence: true

  delegate :name, to: :user, prefix: true, allow_nil: true
end
