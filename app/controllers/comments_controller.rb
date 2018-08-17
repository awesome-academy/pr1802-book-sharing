class CommentsController < ApplicationController
    before_action :logged_in_user , only: %i(create edit update destroy)
    before_action :find_comment, only: %i(edit update destroy)
    
    def new
      @comment = Comment.new
    end
  
    def create
      @comment = Comment.new comment_params
      if @comment.save
        respond_to do |format|
          format.html do 
            redirect_to book_path(@comment.book_id), 
            notice: t(".flash_notice") 
          end
          format.js
        end
      else
        respond_to do |format|
          format.html { render "books/show" }
        end
      end
    end
  
    def edit
    end
  
    def update
      if @comment.update_attributes comment_params
        respond_to do |format|
          format.html do 
            redirect_to book_path(@comment.book_id), 
            notice: t(".flash_notice") 
          end
          format.js
        end    
      else
        respond_to do |format|
          format.html { render "books/show" }
        end
      end
    end
  
    def destroy
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to book, notice: t(".flash_notice") }
        format.js
      end
    end
  
    private
    def find_comment
      @comment = current_user.comments.find_by id: params[:id]
    end
  
    def comment_params
      params.require(:comment).permit :content, :user_id, :book_id
    end
end
