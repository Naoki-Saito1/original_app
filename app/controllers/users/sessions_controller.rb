# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to new_profile_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def guest_sign_in_admin
    user = User.guest_admin
    sign_in user, notice: 'ゲストユーザー(管理者)としてログインしました。'
    redirect_to new_profile_path, notice: 'ゲストユーザー(管理者)としてログインしました。'
  end

  def guest_sign_in_corporate
    user = User.guest_corporate
    sign_in user, notice: 'ゲストユーザー(企業)としてログインしました。'
    redirect_to new_profile_path, notice: 'ゲストユーザー(企業)としてログインしました。'
  end

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
