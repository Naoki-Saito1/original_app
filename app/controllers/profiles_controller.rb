class ProfilesController < ApplicationController
  # before_action :user_check, only: %i[ new show ]
  before_action :set_profile, only: %i[show edit update destroy]
  before_action :authenticate_user!
  def index
    if current_user.try(:admin?)
      @profiles = Profile.all
      @q = Profile.ransack(params[:q])
      @profiles = @q.result(distinct: true).order(created_at: 'DESC').page(params[:page]).per(9)
    else
      redirect_to portfolios_path, notice: '企業様専用です'
    end
  end

  def show
    # binding.irb
  end

  def new
    # binding.irb
    if current_user.profile.present?
      redirect_to profile_path(current_user.profile.id)
    else
      @profile = Profile.new
      render layout: 'no_sidebar'
    end
  end

  def edit; end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'プロフィール登録しました' }
        format.json { render :show, status: :created, location: @profile }
      else
        # flash: @profile.errors.full_messages
        # format.html { render :new, status: :unprocessable_entity }
        format.html { redirect_to new_profile_path, notice: @profile.errors.full_messages }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }

      end
    end
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'プロフィール更新しました' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:image, :name, :gender, :birth_date, :address, :status, :detail, :body, :user_id,
                                    :image_cache, :address_check, :gender_check, :birth_date_check)
  end
end
