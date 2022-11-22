class VideosController < ApplicationController
  before_action :set_user, only: %i[index show new edit update destroy]
  before_action :set_video, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @videos = Video.all
    @referer = request.referer
  end

  def show
    @videos = Video.all
    @video = Video.find_by(public_uid: params[:id])
  end

  def edit
    @video = Video.find_by(public_uid: params[:id])
  end

  def update
    @video = Video.find_by(public_uid: params[:id])
    @video.update(video_params)
    redirect_to user_videos_path
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @video.user = current_user
    if @video.save
      redirect_to user_videos_path
    else
      render :new, stauts: :unprocessable_entity
    end
  end

  def destroy
    @video = Video.find_by(public_uid: params[:id])
    @video.destroy
    redirect_to user_videos_path, notice: 'Video deleted', status: :see_other
  end

  private

  def video_params
    params.require(:video).permit(:title, :cadence_step, :rotation, :addressed, :file)
  end

  def set_user
    @user = current_user
  end

  def set_video
    @video = Video.find_by(public_uid: params[:id])
  end
end
