class CompaniesController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]


  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
  end

  def show
    @user = current_user
    @company = Company.find_by(public_uid: params[:id])
  end

  def edit
    @company = Company.find_by(public_uid: params[:id])
  end

  def update
    @company = Company.find_by(public_uid: params[:id])
    @company.update(company_params)
    redirect_to user_company_path
    flash[:notice] = "Personal Details Updated"
  end

  private

  def set_user
    @user = User.find_by(public_uid: params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :subscription_type, :industry,
                                    :domain, :color_theme1, :color_theme2)
  end

end
