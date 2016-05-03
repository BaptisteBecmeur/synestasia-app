class FavoritesController < ApplicationController
  def index
     @favorites = Favorite.where(user: current_user)
  end

  def create
    #Favorite.create(user_id: User.last.id, favoritable_id: Symbole.last.id, favoritable_type:"Symbole")
    #@favoritable = find_favoritable
    case favorite_params[:favoritable_type]
    when "Symbole"
      @favoritable = Symbole.find(favorite_params[:favoritable_id])
    when "User"
      @favoritable = User.find(favorite_params[:favoritable_id])
    when "Post"
      @favoritable = Post.find(favorite_params[:favoritable_id])
    end
    if @favoritable.present?
      @favorite = Favorite.new(favorite_params.merge(user_id: current_user.id))

      if @favorite.save
        flash[:notice] = "Successfully favorited"
      end
    end

    respond_to do |format|
        format.js { render :ajax_update_favorites }
    end

  end

  def destroy
    case favorite_params[:favoritable_type]
    when "Symbole"
      @favoritable = Symbole.find(favorite_params[:favoritable_id])
    when "User"
      @favoritable = User.find(favorite_params[:favoritable_id])
    when "Post"
      @favoritable = Post.find(favorite_params[:favoritable_id])
    end
    if @favoritable.present?
      @favorite = Favorite.where(favorite_params.merge(user_id: current_user.id))

      if @favorite.destroy_all
        flash[:notice] = "Successfully unfavorited"
      end
    end

    respond_to do |format|
        format.js { render :ajax_update_favorites }
    end
  end

  private

  def favorite_params
    params.permit(:favoritable_type, :favoritable_id)
  end
end
