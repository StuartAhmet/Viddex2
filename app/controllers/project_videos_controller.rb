class ProjectVideosController < ApplicationController
  def create
    @project_video = ProjectVideo.new(project_video_params)
    if @project_video.save
      redirect_to @project_video.project, notice: "Video added to project successfully."
    else
      redirect_to @project_video.project, alert: "Failed to add video to project."
    end
  end

  def destroy
    @project_video = ProjectVideo.find(params[:id])
    @project_video.destroy
    redirect_to @project_video.project, notice: "Video removed from project."
  end

  private

  def project_video_params
    params.require(:project_video).permit(:project_id, :video_id)
  end
end
