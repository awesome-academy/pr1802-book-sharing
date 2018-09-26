class BooksController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: %i(edit update destroy)

  def index
    @books = Book.find_feed(current_user.following_ids << current_user.id)
      .created_at_desc.paginate page: params[:page]
  end

  def show
    @book = Book.find_by id: params[:id]

    if @book.blank?
      flash[:info] = t ".flash_info"
      redirect_to root_url
    else
      @user = @book.user
      @rating = current_user.ratings.find_or_initialize_by book_id: @book.id
      @books_related = Book.related_books(@book).created_at_desc
      @comments = @book.comments.all
      @comment = @book.comments.build
    end
  end

  def new
    @book = current_user.books.build
  end

  def create
    @book = current_user.books.build book_params

    if @book.save
      flash[:success] = t ".flash_success"
      redirect_to @book
    else
      render "static_pages/home"
    end
  end

  def edit; end

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
    params.require(:book).permit :title, :status, :description, pictures: [],
      category_ids: [], author_ids: []
  end

  def correct_user
    @book = current_user.books.find_by id: params[:id]
    redirect_to root_url if book.blank?
  end
end
