class UsersController < ApplicationController
  before_action :set_user, only: %i[index show new edit update destroy]

  def user_id
    @uid = User.find_by(params[:id])
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(public_uid: params[:id])
  end

  def edit
    @user = User.find_by(public_uid: params[:id])
  end

  def update
    @user = User.find_by(public_uid: params[:id])
    @user.update(user_params)
    redirect_to user_path
    flash[:notice] = "Personal Details Updated"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find_by(public_uid: params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :company_name, :industry,
          :email, :password, :meeting_link)
  end



end
