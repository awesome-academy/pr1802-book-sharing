class CommentsController < ApplicationController
  before_action :logged_in_user, only: %i(create update destroy)
  before_action :find_comment, only: %i(update destroy)

  def create
    @comment = current_user.comments.build comment_params
    if @comment.save
      respond_to do |format|
        format.html do
          flash[:success] = t ".flash_success"
          redirect_to book_path comment.book_id
        end
        format.js
      end
    else
      redirect_back fallback_location: root_url
    end
  end

  def update
    if comment.update_attributes comment_params
      respond_to do |format|
        format.js
      end
    else
      redirect_to book_path comment.book
    end
  end

  def destroy
    @book = comment.book
    comment.destroy
    respond_to do |format|
      format.html do
        flash[:success] = t ".flash_success"
        redirect_to @book
      end
      format.js
    end
  end

  private

  attr_reader :comment

  def find_comment
    @comment = current_user.comments.find_by id: params[:id]
  end

  def comment_params
    params.require(:comment).permit :content, :user_id, :book_id
  end
end
