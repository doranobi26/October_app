class PostsController < ApplicationController

  def create
    @post=Post.new(post_params)
    @post.user_id = current_user.id
    @posts=Post.all
    if @post.save
      redirect_to post_path(@post.id)
    else
      render "index"
    end
  end


  def show
    @post=Post.find(params[:id])
    @user=@post.user
  end

  def index
    @posts=Post.all
    @post=Post.new
  end

  def edit
    @post=Post.find(params[:id])
    if @user!=current_user
      redirect_to posts_path
    end
  end

  def update
    @post=Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render "edit"
    end
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :caption, :user_id, :category_id, :member_id)
  end
end
