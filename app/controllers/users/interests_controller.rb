class Users::InterestsController < ApplicationController

	def create
		@recipe = Recipe.find(params[:recipe_id])
		@interest = @recipe.interests.new(user_id: current_user.id)
		@interest.save
		redirect_back(fallback_location: root_path)
	end

	def destroy
		@recipe = Recipe.find(params[:recipe_id])
		@interest = current_user.interests.find_by(recipe_id: @recipe.id)
		@interest.destroy
		redirect_back(fallback_location: root_path)
	end
end
