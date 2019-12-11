class Admin::CategoriesController < ApplicationController
  layout 'backend'

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: '建立成功'
    else
      render :new 
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: '更新成功'
    else
     render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path,notice: '刪除成功'
  end
  
  private

  def category_params
    params.require(:category).permit(:title)
  end
end
