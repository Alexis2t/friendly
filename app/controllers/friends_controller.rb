class FriendsController < ApplicationController
  before_action :set_friend, only: :show
  def index
    @friends = Friend.all
  end

  def show
  end

  private

  def set_friend
    @friend = Friend.find(params[:id])
  end
end
