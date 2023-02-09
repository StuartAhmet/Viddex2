class ProjectsController < ApplicationController
  before_action :set_user, only: %i[index show new edit update destroy]
  before_action :set_project, only: %i[show edit update destroy]
  before_action :authenticate_user!, :except => [:show]

  def index
    @projects = Project.all

  end

  def show
    @project = Project.find_by(public_uid: params[:id])

  end

  def new
    @project = Project.new

    # @user_backgrounds = Background.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    # @project.video = Video.find(project_params[:video_id])
    if @project.save
      redirect_to user_projects_path
      flash[:notice] = "Project Created"
    else
      flash.now[:error] = "Could not create project"
    end
  end

  def edit
    @project = Project.find_by(public_uid: params[:id])
  end

  def update
    @project = Project.find_by(public_uid: params[:id])
    @project.video = Video.find(project_params[:video_id])
    @project.update(project_params)
    redirect_to edit_user_project_path
    flash[:notice] = "Project Updated"
  end

  def destroy
    @project = Project.find_by(public_uid: params[:id])
    @project.destroy
    redirect_to user_projects_path, notice: 'Project deleted', status: :see_other
  end

  private

  def set_user
    @user = current_user
  end

  def set_project
    @project = Project.find_by(public_uid: params[:id])
  end

  def project_params
    params.require(:project).permit(
                                    :prospect_first,
                                    :prospect_last, :prospect_email, :prospect_company,
                                    :message_body, :font, :opacity, :font_size, :title,
                                    backgrounds_attributes: [:id], videos_attributes: [:id], audios_attributes: [:id])
  end
end
