class CategoriesController < ApplicationController
  before_action :logged_in_user, only: %i(index show new create edit update destroy)
  before_action :find_category, only: %i(show edit update destroy)
  before_action :admin_user, only: %i(new create edit update destroy)

  def index
    @categories = Category.paginate page: params[:page]
  end

  def show; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t ".flash_success"
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if category.update_attributes category_params
      flash[:success] = t ".flash_success"
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    category.destroy
    flash[:success] = t ".flash_success"
    redirect_to categories_path
  end

  private

  attr_reader :category

  def category_params
    params.require(:category).permit :name
  end

  def find_category
    @category = Category.find_by id: params[:id]
    return if category

    flash[:info] = t ".flash_info"
    redirect_to root_path
  end
end
