class CategoriesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :find_category, only: [:show, :edit, :update, :destroy]

  def show
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      render :new
    end
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def update

  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to post_path(@post)
  end

  private


   def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end


