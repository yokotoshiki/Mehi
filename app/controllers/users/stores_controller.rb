class Users::StoresController < ApplicationController
	def index
		@stores = Stores.all
	end

	def show
		@store = Store.find(params[:id])
    end
end
