class LinksController < ApplicationController
  def new
    @link = Link.new
  end

  def create 
    @link = Link.new(link_params)
    if @link.save
      redirect_to 
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
