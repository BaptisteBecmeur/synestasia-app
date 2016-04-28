class FavoritesController < ApplicationController
  def index
     @favorites = Favorite.where(user: current_user)
  end

  # def show
  # end

  # def new
  # end

  def create
    #Favorite.create(user_id: User.last.id, favoritable_id: Symbole.last.id, favoritable_type:"Symbole")
    # @symbole = Symbole.find(params[:symbole_id])
    # @sentence = Sentence.find(params[:sentence_id])
    @favorite = current_user.favoritable.favorites.create(symbole: @symbole, sentence: @sentence).first
    if @favorite.present?
       @favorite.destroy
    else
      @favorite = current_user.favorites.new(symbole: @symbole, sentence: @sentence)
      if not @symbole.favorites.where(user: current_user).take
          @sentence.favorites.where(user: current_user).take
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
