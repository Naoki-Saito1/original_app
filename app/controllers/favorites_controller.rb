class FavoritesController < ApplicationController
  before_action :portfolio_params
  def index
    @favorites = current_user.favorites.all
    # binding.irb
  end

  def create
    @favorite = Favorite.create(user_id: current_user.id, portfolio_id: params[:portfolio_id])
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, portfolio_id: params[:portfolio_id]).destroy
  end

  private
  def portfolio_params
    @portfolio = Portfolio.find(params[:portfolio_id])
  end
  
end
