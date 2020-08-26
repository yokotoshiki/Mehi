class Users::StoresController < ApplicationController
	# ログイン済ユーザーのみにアクセスを許可する
    before_action :authenticate_user!
	def index
		@stores = Store.all
	end

	def show
		@store = Store.find(params[:id])
    end
end
