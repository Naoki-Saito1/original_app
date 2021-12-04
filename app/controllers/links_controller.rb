class LinksController < ApplicationController
  
  def new
    @link = Link.new
  end

  def create 
    @link = Link.new(link_params)
    @link.profile_id = current_user.profile.id
    if @link.save
      redirect_to profile_path(current_user.profile.id)
    else
      render :new
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def edit

  end

  def destroy
    @link = Link.find(params[:id])
  end

  private
  def link_params
    params.require(:link).permit(:twitter, :github, :qiita)
  end
end
