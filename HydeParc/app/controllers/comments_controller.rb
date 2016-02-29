class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @user = User.find(current_user.id)
    @post = Post.find(params[:post_id])
    @comment.user = @user
    @comment.post = @post
    
    if @comment.save
      redirect_to community_post_path(@comment.post)
    else
      render action: :new
    end
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update_attributes(comment_params)
      redirect_to community_post_path(@comment.post)
    else
      render action: :edit
    end
  end

  def destroy
    # Comment.find(params[:id]).destroy
    # redirect_to action: :index
  end
  
  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
