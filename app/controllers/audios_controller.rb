class AudiosController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!

  def index
    @audios = Audio.all
  end

  def show
    @audios = Audio.all
    @audio = Audio.find_by(public_uid: params[:id])
  end

  def edit
    @audio = Audio.find_by(public_uid: params[:id])
  end

  def update
    @audio = Audio.find_by(public_uid: params[:id])
    @audio.update(audio_params)
    redirect_to user_audios_path
    flash[:notice] = "File Updated"
  end

  def new
    @audio = Audio.new
  end

  def create
    @audio = Audio.new(audio_params)
    @audio.user = current_user
    if @audio.save
      redirect_to user_audios_path
    else
      render :new, stauts: :unprocessable_entity
    end
  end

  def destroy
    @audio = Audio.find_by(public_uid: params[:id])
    @audio.destroy
    redirect_to user_audios_path
    flash[:notice] = "File Deleted"
  end

  private

  def audio_params
    params.require(:audio).permit(:title, :file)
  end

  def set_user
    @user = current_user
  end
end
