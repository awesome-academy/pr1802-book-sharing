class SearchesController < ApplicationController
  def index
    if params[:search]
      @results = Book.all
      if params[:search][:name].present?
        @results = @results.by_title params[:search][:name]
      end
      if params[:search][:author_ids].present?
        @results = @results.by_author_ids params[:search][:author_ids]
      end
      if params[:search][:category_ids].present?
        @results = @results.by_category_ids params[:search][:category_ids]
      end
    else
      render :index
    end
  end
end
