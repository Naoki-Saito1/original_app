class TopsController < ApplicationController
  before_action :signed_in_user
  def home
    render layout: "top"
  end
  def signed_in_user
    if user_signed_in?
     redirect_to portfolios_path,  notice: 'それはできません'
     end
  end
end
