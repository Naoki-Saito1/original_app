class OpenPortfoliosController < ApplicationController
  before_action :set_portfolio, only: %i[show edit update destroy]
 
  def index
    @open_portfolios = Portfolio.all
    @q = Portfolio.ransack(params[:q])
    @open_portfolios = @q.result(distinct: true).order(created_at: 'DESC').page(params[:page]).per(6)
    render layout: 'no_sidebar'
  end

  def show
    @favorite = current_user.favorites.find_by(portfolio_id: @portfolio.id)
  end


  private

  def set_search
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
  end

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit(:portfolio_title, :portfolio_body, :portfolio_image, :portfolio_language,
                                      :portfolio_github, :portfolio_url, :user_id, :image_cache, frameworks_attributes: %i[id portfolio_id framework_name _destroy])
  end
end

