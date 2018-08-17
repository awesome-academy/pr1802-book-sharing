class BooksController < ApplicationController
  before_action :logged_in_user, only: %i(show create edit update destroy)
  before_action :correct_user, only: %i(show edit update destroy)

  def show
    @user = @book.user
  end

  def create
    @book = current_user.books.build book_params
    if @book.save
      params[:categories].each do |categories|
        categories = BookCategory.new(:category_id => categories, :book_id => @book_id)
        if categories.valid?
          categories.save
        else
          @errors += categories.errors
        end
      end
      flash[:success] = t ".flash_success"
      redirect_to root_url
    else
      @feed_items = []
      render "static_pages/home"
    end
  end

  def edit
  end

  def update
    if book.update_attributes book_params
      flash[:success] = t ".flash_success"
      redirect_to book
    else
      render :edit
    end
  end

  def destroy
    book.destroy
    flash[:success] = t ".flash_success"
    redirect_back fallback_location: root_url
  end

  private

  attr_reader :book

  def book_params
    params.require(:book).permit :name, :description, :picture
  end

  def correct_user
    @book = current_user.books.find_by id: params[:id]
    redirect_to root_url if book.nil?
  end
end
