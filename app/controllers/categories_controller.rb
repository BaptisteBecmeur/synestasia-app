class CategoriesController < ApplicationController
   before_action :set_category, only: [:show, :new, :create, :destroy]

  def show
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.all
  end

  def create
    @category = categories.new(category_params)
    if @category.save
      redirect_to @post
    else
      render 'categories/show'
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


  # def set_post
  #   @post = Post.find(params[:post_id])
  # end

  # def set_category
  #   @category = Category.find(params[:category_id])
  # end

    def set_category
      if params[:id].present?
        @category = Category.find(params[:id])
      else
        @category = Category.new
      end
    end

  #  def find_category
  #   @category = Category.find(params[:id])
  # end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
