class Users::UsersController < ApplicationController
	# ログイン済ユーザーのみにアクセスを許可する
    before_action :authenticate_user!

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
		@user.id = current_user
		if@user.update(user_params)
		redirect_to users_user_path(current_user.id)
	    else
	end

	private
	def user_params
		params.require(:user).permit(:name,:nickname,:introduction)
	end
end
