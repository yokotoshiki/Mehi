class Admin::StoresController < ApplicationController
	# 管理者のみにアクセスを許可する
	before_action :authenticate_admin!

	def index
		@stores = Store.all
	end

	def show
		@store = Store.find(params[:id])
    end

    def new
    	@store = Store.new
    end

	def create
		 @store = Store.new(store_params)
       if@store.save
		 redirect_to  admin_stores_path
	 else
	 	render 'new'
	 end
	end


	def edit
		@store = Store.find(params[:id])
	end

	def update
		@store = Store.find(params[:id])
	  if@store.update(store_params)
		redirect_to  admin_stores_path
	else
		render 'edit'
	  end
	end

	def destroy
		@store = Store.find(params[:id])
		@store.destroy
		redirect_to  admin_stores_path
	end

    private

    def store_params
    	params.require(:store).permit(:name, :explanation, :area, :url, :address, :store_category_id,:image)
    end
end
