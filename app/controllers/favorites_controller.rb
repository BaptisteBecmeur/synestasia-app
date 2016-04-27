class FavoritesController < ApplicationController
  def index
     @favorites = Favorite.where(user: current_user)
  end

  # def show
  # end

  # def new
  # end

  def create
     @hiragana = Hiragana.find(params[:hiragana_id])
    @favorite = current_user.favoritess.where(hiragana: @hiragana).first
    if @favorite.present?
      @favorite.destroy
    else
      @favorite = current_user.favorites.new(hiragana: @hiragana)
      if not @hiragana.favorites.where(user: current_user).take
        @favorite.save
      end
    end
    # redirect_to favs_path
    # redirect_to :back
    respond_to do |format|
      format.js { render :ajax_update_favs }
    end
  end

  # def edit
  # end

  # def update
  # end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to :back
  end
end
