class TemplatesController < ApplicationController
  before_action :set_user, only: %i[index show new create edit update destroy]
  before_action :require_admin, only: [:new]

  def index
    @templates = Template.all
  end

  def show
    @template = Template.find_by(public_uid: params[:id])
  end

  def new
    @user = current_user
    @template = Template.new
    # @template.video_items.build
  end

  def create
    @template = Template.new(template_params)
    @template.user = current_user
    if @template.save
      redirect_to user_templates_path
    else
      render :new, stauts: :unprocessable_entity
    end
  end

  private

  def template_params
    params.require(:template).permit(
      :title, :synopsis, :category, :video_count, :audio_required,
      :video_link, :tutorial_link, :video_title1, :video_title2, :video_title3,
      :video_title4, :video_script1, :video_script2, :video_script3, :video_script4
    )
  end

  def set_user
    @user = current_user
  end

  def require_admin
    unless current_user && current_user.admin?
      flash[:alert] = "Access denied. Only administrators can access this page."
      redirect_to user_templates_path # Change the path to the page you want to redirect non-admin users
    end
  end
end
