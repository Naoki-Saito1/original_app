class TopsController < ApplicationController
  before_action :signed_in_user
  def home
    render layout: 'top'
  end

  def signed_in_user
    redirect_to portfolios_path, notice: 'その操作はできません' if user_signed_in?
  end
end
