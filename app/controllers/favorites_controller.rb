class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(portfolio_id: params[:portfolio_id])
    redirect_to portfolios_path, notice: "#{favorite.portfolio.user.profile.name}さんのブログをお気に入り登録しました"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to portfolios_path, notice: "#{favorite.portfolio.user.profile.name}さんのブログをお気に入り解除しました"
  end
end
