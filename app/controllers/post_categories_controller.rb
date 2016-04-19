class PostCategoriesController < ApplicationController
   # before_action :set_post_category, only: [:show, :new, :create, :destroy]

  def show
    @post_category = PostCategory.find(params[:id])
  end

  def index
    @post_categories = PostCategory.all
  end

  def create
    @post_category = post_categories.new(post_category_params)
    if @post_category.save
      redirect_to @post
    else
      render 'post_categories/show'
    end
  end

  def new
    @post_category = PostCategory.new
  end

  def edit
  end

  def update

  end

  def destroy
    @post_category = PostCategory.find(params[:id])
    @post_category.destroy
    redirect_to post_path(@post)
  end

  private


  # def set_post
  #   @post = Post.find(params[:post_id])
  # end

   def find_post_category
    @post_category = PostCategory.find(params[:id])
  end

  def post_category_params
    params.require(:post_category).permit(:name, :description)
  end
end
