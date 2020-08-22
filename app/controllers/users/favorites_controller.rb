class Users::FavoritesController < ApplicationController

	def create
		@recipe = Recipe.find(params[:recipe_id])
		@favorite = @recipe.favorites.new(user_id: current_user.id)
		@favorite.save
		redirect_back(fallback_location: root_path)
	end

	def destroy
		@recipe = Recipe.find(params[:recipe_id])
		@favorite = current_user.favorites.find_by(recipe_id: @recipe.id)
		@favorite.destroy
		redirect_back(fallback_location: root_path)
	end
end
