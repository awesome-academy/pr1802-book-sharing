class CategoriesController < ApplicationController
  before_action :logged_in_user, only: %i(index, edit, update, destroy)
  before_action :admin_user, only: :destroy

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find params[:id]
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    if @category.update_attributes category_params
      flash[:success] = "Category updated"
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit :name
  end
end
