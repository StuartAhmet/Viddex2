class ProjectsController < ApplicationController
  before_action :set_user, only: [:index, :show, :new, :edit, :update, :destroy, :preview]
  before_action :set_project, only: %i[ edit update destroy preview]
  before_action :authenticate_user!, :except => [:preview]

  def index
    @user = current_user
    @projects = @user.projects.order(id: :desc).page(params[:page]).per(10)
  end

  def choosevid
    @project = Project.find(params[:id])
    @selectedVideos = @project.videos.order(:position)
  end

  def show
    @project = Project.find_by(public_uid: params[:id])
  end

  def new
    @user = current_user
    @project = Project.new
    @templates = Template.all
    # @user_backgrounds = Background.find(params[:id])
  end

  def preview
    @project = Project.find_by(public_uid: params[:id])
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    # @project.project_videos = project_params[:project_videos]
      if @project.save
        redirect_to @project
        flash[:notice] = "Project Created"
      else
        render 'new', status: :unprocessable_entity
      end

  end

  def edit
    @project = Project.find_by(public_uid: params[:id])
  end

  def update
    set_project
    # @project.videos = Video.find(project_params[:video_ids])
    @project.update(project_edit_params)
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
    permitted_params = params.require(:project).permit(
      :prospect_first, :prospect_last, :prospect_email, :prospect_company,
      :message_body, :font, :opacity, :font_size, :title, :include_meeting_link,
      background_ids: [], audio_ids: [], video_ids: [], template_ids: []
    )
    video_ids = permitted_params.delete(:video_ids)
    project_video_params = video_ids.map.with_index { |id, index| { video_id: id, position: index } }
    permitted_params.merge(project_videos_attributes: project_video_params)
  end

  def project_edit_params
    params.require(:project).permit(
      :prospect_first, :prospect_last, :prospect_email, :prospect_company,
      :message_body, :font, :opacity, :font_size, :title, :include_meeting_link,
      background_ids: [], audio_ids: [], template_ids: []
    )

  end
end
