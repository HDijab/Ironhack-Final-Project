class CommunitiesController < ApplicationController
  before_action :authenticate_user!, only: :show
  
  def index
    @communities = Community.all
  end

  def show
    @community = Community.find(params[:id])
  end
end
