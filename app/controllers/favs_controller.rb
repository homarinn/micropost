class FavsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:like_id])
    current_user.like(micropost)
    flash[:success] = "投稿をお気に入りしました。"
    redirect_back(fallback_location: root_url)
  end

  def destroy
    micropost = Micropost.find(params[:like_id])
    current_user.unlike(micropost)
    flash[:success] = "投稿のお気に入りを解除しました。"
    redirect_back(fallback_location: root_url)
  end
end
