class CategoriesController < ApplicationController
  def show
    @category = Category.find params[:id]
    @comics = @category.comics
  end

  def index
    @categories = Category.all
    @category = Category.new
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t '.category_created'
      redirect_to categories_path
    else
      flash[:danger] = t '.category_fail'
      redirect_to categories_path
    end
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    if @category.update_attributes category_params
      flash[:success] = t '.category_updated'
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    flash[:success] = t '.category_deleted'
    redirect_to categories_path
  end

  private
  def set_category
    if params[:id].present?
      @category = Category.find params[:id]
    else
      @category = Category.new
    end
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
