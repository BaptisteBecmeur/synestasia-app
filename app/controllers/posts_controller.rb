class PostsController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    # @alert_message = "Vous lisez #{@post.title}"
  end

  def new
    # if current_user and current_user.admin?
      @post = Post.new
    # else
    #   redirect_to posts_path
    # end
  end

  def create
    # if current_user and current_user.admin?
     @post = current_user.posts.new(post_params)
      #@post = current_user.posts.new(post_params)
      if @post.save
        redirect_to @post
      else
        render :new
      end
    # else
    #   render 'shared/404.html.erb'
    # end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to :back
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  # def set_category
  #   @post_category = Category.find(params[:category_id])
  # end

  def post_params
    params.require(:post).permit(:title, :subtitle, :introduction, :body, :cover, :tag, :)
  end
end
