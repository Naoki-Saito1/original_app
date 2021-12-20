class TopsController < ApplicationController
  before_action :signed_in_user
  def home
    render layout: 'top'
  end


  def signed_in_user
    if user_signed_in? && current_user.try(:admin?)
    redirect_to portfolios_path
    elsif user_signed_in?
      redirect_to portfolios_path, notice: "このページへのアクセスは許可されていません。"
    end
  end
end
