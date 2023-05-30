class CategoriesController < ApplicationController
  def index
    @user = current_user
    @categories = @user.categories.order(title: :asc)
  end

  def show
    @categories = Category.all
    # @video = Video.find_by(public_uid: params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    # redirect_to edit_user_video_path
    # flash[:notice] = "Video Updated"
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    if @category.save
      redirect_to user_categories_path
    else
      render :new, stauts: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to user_categories_path
    # flash[:notice] = "Video Deleted"
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
