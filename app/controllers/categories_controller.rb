class CategoriesController < ApplicationController
  
  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to categories_path, notice: "created category successfully"
    else
      @errors = @category.errors.full_messages
      render :new
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to categories_path, notice: "deleted category successfully"
  end
  
  def edit
    @category = Category.find params[:id]
  end

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def update
    @category = Category.find params[:id]
    if @category.update_attributes(params[:category])
      redirect_to categories_path, notice: "updated category successfully"
    else
      @errors = @category.errors.full_messages
      render :edit
    end
  end
end
