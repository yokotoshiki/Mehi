class Users::UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@recipes = @user.recipes.all
		@interests = current_user.interests
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to users_user_path(current_user.id)
	end

	private
	def user_params
		params.require(:user).permit(:name,:nickname,:introduction)
	end
end
