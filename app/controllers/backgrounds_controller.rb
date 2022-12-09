class BackgroundsController < ApplicationController
  before_action :set_user, only: %i[index show new edit update destroy]
  before_action :set_background, only: %i[show edit update destroy]
  before_action :authenticate_user!


  def index
    @backgrounds = Background.all
  end

  def show
    @background = Background.find(params[:id])
    @backgrounds = Background.all
  end

  def new
    @background = Background.new
  end

  def create
    @background = Background.new(background_params)
    @background.user = current_user
    if @background.save
      redirect_to user_backgrounds_path
    else
      render :new, stauts: :unprocessable_entity
    end
  end

  def edit
    @background = Background.find_by(public_uid: params[:id])
  end

  def update
    @background = Background.find_by(public_uid: params[:id])
    @background.update(background_params)
    redirect_to edit_user_background_path
    flash[:notice] = "Background Updated"
  end

  def destroy
    @background = Background.find_by(public_uid: params[:id])
    @background.destroy
    redirect_to user_backgrounds_path
    flash[:notice] = "Background Deleted"
  end

  private

  def background_params
    params.require(:background).permit(:title, :photo, :x_axis, :y_axis, :width, :angle)
  end

  def set_user
    @user = current_user
  end

  def set_background
    @background = Background.find_by(public_uid: params[:id])
  end

end
