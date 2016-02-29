class PostsController < ApplicationController
  before_action :authenticate_user!

  def show
    @post = Post.find(params[:id])
    @new_comment = Comment.new
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @user = User.find(current_user.id)
    @community = Community.find(params[:community_id])
    @post.user = @user
    @post.community = @community

    if @post.save
      redirect_to community_post_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to community_post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    # Post.find(params[:id]).destroy
    # redirect_to action: :index
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
