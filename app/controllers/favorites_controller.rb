class FavoritesController < ApplicationController
  def index
     @favorites = Favorite.where(user: current_user)
  end

  def create
    #Favorite.create(user_id: User.last.id, favoritable_id: Symbole.last.id, favoritable_type:"Symbole")
    @favoritable = find_favoritable
    @favorite = @favoritable.favorites.build(favorite_params)

    if @favorite.save
      flash[:notice] = "Successfully created comment."
    redirect_to :id => nil
  else
    render :action => 'new'
  end

    respond_to do |format|
      format.js { render :ajax_update_favorites }
    end
  end



  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to :back
  end

  private

  def favorite_params
    params.require(:favorite).permit(:favorite_type, :favorite_id)
  end
end
