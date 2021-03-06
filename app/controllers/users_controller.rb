class UsersController < ApplicationController
  before_action :logged_in_user, only: %i(index edit update destroy)
  before_action :find_user, only: %i(show edit update destroy)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate page: params[:page]
    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv()}
      format.xls { send_data @users.to_csv(col_sep: "\t")}
    end
  end

  def show
    @books = user.books.created_at_desc.paginate page: params[:page]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t ".flash_info"
      redirect_to root_url
    else
      render :new
    end
  end

  def edit; end

  def update
    if user.update_attributes user_params
      flash[:success] = t ".flash_success"
      redirect_to user
    else
      render :edit
    end
  end

  def destroy
    user.destroy
    flash[:success] = t ".flash_success"
    redirect_to users_url
  end

  private

  attr_reader :user

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end

  def correct_user
    find_user
    redirect_to root_url unless current_user? user
  end

  def find_user
    @user = User.find_by id: params[:id]
    return if user

    flash[:info] = t ".flash_info"
    redirect_to root_path
  end
end
