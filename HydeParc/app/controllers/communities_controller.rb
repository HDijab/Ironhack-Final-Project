class CommunitiesController < ApplicationController
  before_action :authenticate_user!, except: :index
  
  def index
    @communities = Community.all
  end

  def show
    @community = Community.find(params[:id])
    @posts = @community.posts
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    
    if @community.save
      redirect_to community_path(id: @community)
    else
      render action: :new
    end
  end

  def edit
    @community = Community.find(params[:id])
  end

  def update
    @community = Community.find(params[:id])

    if @community.update_attributes(community_params)
      redirect_to community_path(id: @community)
    else
      render action: :edit
    end
  end

  def destroy
    # Community.find(params[:id]).destroy
    # redirect_to action: :index
  end
  
  private

  def community_params
    params.require(:community).permit(:name)
  end
end
