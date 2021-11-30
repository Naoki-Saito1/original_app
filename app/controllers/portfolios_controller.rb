class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: %i[ show edit update destroy ]

  def index
    @portfolios = Portfolio.all
    @q = Portfolio.ransack(params[:q])
    @portfolios = @q.result(distinct: true)
    #if params[:hoge] == "true"
    #  @portfolios = @portfolios.includes(:favorite_users).sort {|a,b| b.favorite_users.size <=> a.favorite_users.size} 
    # end

    params[:hoge] = nil if params[:hoge] == "true" && params[:q].present?
    # Guard Clause
    return if params[:hoge] != "true"
    @portfolios = @portfolios.includes(:favorite_users).sort {|a,b| b.favorite_users.size <=> a.favorite_users.size} 
    
  end

  def show
    @favorite = current_user.favorites.find_by(portfolio_id: @portfolio.id)
  end

  def new
    @portfolio = Portfolio.new
    @framework = @portfolio.frameworks.build
  end

  def edit
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    @portfolio.user_id = current_user.id
    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to @portfolio, notice: "Portfolio was successfully created." }
        format.json { render :show, status: :created, location: @portfolio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to @portfolio, notice: "Portfolio was successfully updated." }
        format.json { render :show, status: :ok, location: @portfolio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @portfolio.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: "Portfolio was successfully destroyed." }
      format.json { head :no_content }
    end
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
      params.require(:portfolio).permit(:portfolio_title, :portfolio_body, :portfolio_image, :portfolio_language, :portfolio_github, :portfolio_url, :user_id, :image_cache,
        frameworks_attributes:[:id, :portfolio_id, :user_id, :framework_name, :_destroy])
    end
end
