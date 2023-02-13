class ProjectAudiosController < ApplicationController
  def create
    @project_audio = ProjectAudio.new(project_audio_params)
    if @project_audio.save
      redirect_to @project_audio.project, notice: "Audio added to project successfully."
    else
      redirect_to @project_audio.project, alert: "Failed to add audio to project."
    end
  end

  def destroy
    @project_audio = ProjectAudio.find(params[:id])
    @project_audio.destroy
    redirect_to @project_audio.project, notice: "Audio removed from project."
  end

  private

  def project_audio_params
    params.require(:project_audio).permit(:project_id, :audio_id)
  end
end
