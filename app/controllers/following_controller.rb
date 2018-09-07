class FollowingController < ApplicationController
  def index
    @title = t ".following"
    @user  = User.find_by id: params[:user_id]
    @users = @user.following.paginate page: params[:page]
    render "shared/show_follow"
  end
end
