class FriendsController < ApplicationController
  before_action :set_friend, only: %i[show destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @friends = Friend.all
  end

  def show
  end

  def new
    @friend = Friend.new
  end

  def create
    if user_signed_in?
      friend = Friend.new(friend_params)
      friend.user = current_user
      if friend.save
        redirect_to dashboard_path(current_user)
      else
        render "new", status: :unprocessable_entity
      end
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    if @friend.user == current_user
      @friend.destroy
      redirect_to dashboard_path(current_user)
    else
      flash[:alert] = "Vous ne pouvez pas detruire cet amis"
      redirect_to friends_path
    end
  end

  private

  def set_friend
    @friend = Friend.find(params[:id])
  end

  def friend_params
    params.require(:friend).permit(:name, :photo, :price_per_day, :description)
  end
end
