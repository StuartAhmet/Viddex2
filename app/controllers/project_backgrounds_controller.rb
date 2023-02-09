class ProjectBackgroundsController < ApplicationController
  def create
    @project_background = ProjectBackground.new(project_background_params)
    if @project_background.save
      redirect_to @project_background.project, notice: "Image added to project successfully."
    else
      redirect_to @project_background.project, alert: "Failed to add image to project."
    end
  end

  def destroy
    @project_background = ProjectBackground.find(params[:id])
    @project_background.destroy
    redirect_to @project_background.project, notice: "Image removed from project."
  end

  private

  def project_background_params
    params.require(:project_background).permit(:project_id, :background_id)
  end
end
