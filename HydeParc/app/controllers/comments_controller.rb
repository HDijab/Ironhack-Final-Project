class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @user = User.find(current_user.id)
    @post = Post.find(params[:post_id])
    @comment.user = @user
    @comment.post = @post
    
    if @comment.save
      redirect_to community_post_path(community_id: @comment.post.community_id, id: @comment.post.id)
    else
      redirect_to community_post_path(community_id: @comment.post.community_id, id: @comment.post.id)
    end
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update_attributes(comment_params)
      redirect_to community_post_path(community_id: @comment.post.community_id, id: @comment.post.id)
    else
      render :edit
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
