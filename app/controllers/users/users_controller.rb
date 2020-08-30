class Users::UsersController < ApplicationController
	# ログイン済ユーザーのみにアクセスを許可する
    before_action :authenticate_user!
    before_action :ensure_correct_user, only: [:edit, :update]

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
		if@user.update(user_params)
		redirect_to users_user_path(current_user.id)
	    else
	    render 'new'
        end
	end

	private

	def ensure_correct_user
        @user = User.find(params[:id])
    unless @user == current_user
        redirect_to root_path
     end
   end
	def user_params
		params.require(:user).permit(:name,:nickname,:introduction)
	end
end
