class VideosController < ApplicationController
  before_action :set_user, only: %i[index show new create edit update destroy]
  before_action :set_video, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @user = current_user
    @videos = @user.videos.order(id: :desc).page(params[:page]).per(15)
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
    redirect_to edit_user_video_path
    flash[:notice] = "Video Updated"
  end

  def new
    @user = current_user
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
    redirect_to user_videos_path
    flash[:notice] = "Video Deleted"
  end

  private

  def video_params
    params.require(:video).permit(:title, :text_body, :cadence_step, :industry, :addressed, :file, :bgrem_require,
      :text_distortion,
      :distort_nw_x,
      :distort_nw_y,
      :distort_ne_x,
      :distort_ne_y,
      :distort_sw_x,
      :distort_sw_y,
      :distort_se_x,
      :distort_se_y,
      :text_width,
      :text_box_height,
      :x_axis,
      :y_axis,
      :angle,
      :thumbnail)
  end

  def set_user
    @user = current_user
  end

  def set_video
    @video = Video.find_by(public_uid: params[:id])
  end

  def thumbnail_url
    self.thumbnail
  end

end
