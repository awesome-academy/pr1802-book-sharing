class StaticPagesController < ApplicationController
  def home
    @recently_published = Book.recently_published
    @completed = Book.completed_status.created_at_desc.limit 6
    @on_going = Book.on_going_status.created_at_desc.limit 6
  end
end
