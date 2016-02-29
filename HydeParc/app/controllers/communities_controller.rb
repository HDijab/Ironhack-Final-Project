class CommunitiesController < ApplicationController
  before_action :authenticate_user!, only: :show
  
  def index
    @communities = Community.all
  end

  def show
    @community = Community.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
