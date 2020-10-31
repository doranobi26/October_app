class NicesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    nice = post.nices.new(user_id: current_user.id)
    nice.save
    redirect_to request.referer
  end

  def destroy
    post = Post.find(params[:post_id])
    nice = post.nices.find_by(user_id: current_user.id)
    nice.destroy
    redirect_to request.referer
  end
end
