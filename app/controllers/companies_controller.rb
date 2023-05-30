class CompaniesController < ApplicationController

  def new
    @company = Company.new
  end
  def create
    @company = Company.new(company_params)
    # if @user.save
    #   redirect_to user_path(@user)
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end

  private

  def company_params
    params.require(:company).permit(:name, :subscription_type, :industry,
                                    :domain, :color_theme1, :color_theme2)
  end

end
