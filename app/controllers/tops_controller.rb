class TopsController < ApplicationController
  before_action :signed_in_user
  def home
    render layout: 'top'
  end


  def signed_in_user
    redirect_to portfolios_path if user_signed_in?
      
  end
  
end
# 



# 一般がローカル3000ー＞リダイレクトされました（リダイレクト先は変更できるが回避不可）
# アドミンローカル3000ー＞リダリレクトされました（リダイレクト先は変更できるが回避不可）


# 一般がアドミンをふむー＞管理者以外アクセスできません（アドミンの決まり？ルートに行く）
# アドミンアドミンからホームー＞リダイレクトされましたorフラッシュなし（アドミンの決まり？ルートに行く）


# ルートパスをトップじゃなくする？
# 別の問題が出そうまだためしていない






#  # if current_user.try(:admin?)
#  redirect_to portfolios_path, notice: 'リダイレクトされました' 
#  # else
#    # redirect_to profile_path(id: current_user.id) ,notice: '無効な操作が行われたためリダイレクトされました' 
#  # end