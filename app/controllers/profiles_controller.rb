class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  def index
    @profiles = Profile.all
    @q = Profile.ransack(params[:q])
    @profiles = @q.result(distinct: true).order(created_at: "DESC").page(params[:page]).per(9)
   
  end

  def show
# binding.irb
    if current_user.profile.nil?
      redirect_to new_profile_path 
    end
  end

  def new
    @profile = Profile.new
    render layout: "no_sidebar"
  end

  def edit
    
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: "Profile was successfully created." }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
    
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: "Profile was successfully updated." }
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
      format.html { redirect_to profiles_url, notice: "Profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:image, :name, :gender, :birth_date, :address, :status, :detail, :body, :user_id, :image_cache, :address_check, :gender_check, :birth_date_check)
    end
end
