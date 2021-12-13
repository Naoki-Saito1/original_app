class LinksController < ApplicationController
  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.profile_id = current_user.profile.id
    if @link.save
      redirect_to profile_path(current_user.profile.id), notice: '登録しました'
    else
      render :new
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      redirect_to profile_path(current_user.profile.id), notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    @link = Link.find(params[:id])
  end

  private

  def link_params
    params.require(:link).permit(:twitter, :github, :qiita, :profile_id)
  end
end
