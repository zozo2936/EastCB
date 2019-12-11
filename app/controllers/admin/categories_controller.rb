class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @categories.save
      redirect_to admin_categories_path, notic:'成功'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end


end
