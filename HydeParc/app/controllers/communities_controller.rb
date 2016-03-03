class CommunitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @communities = Community.all
  end

  def show
    @community = Community.find(params[:id])
    @posts = @community.posts.reverse
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    render :new unless @community.save
    
    @membership = CommunityMember.new(user_id: current_user.id, community_id: @community.id, role: 'creator')

    if @membership.save
      redirect_to community_path(@community)
    else
      @community = @community.destroy
      render :new
    end
  end

  def edit
    @community = Community.find(params[:id])
  end

  def update
    @community = Community.find(params[:id])

    if @community.update_attributes(community_params)
      redirect_to community_path(@community)
    else
      render :edit
    end
  end

  def destroy
    # Community.find(params[:id]).destroy
    # redirect_to action: :index
  end
  
  private

  def community_params
    params.require(:community).permit(:name, :about)
  end
end
