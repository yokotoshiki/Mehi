class Admin::StoreCategoriesController < ApplicationController
    # 管理者のみにアクセスを許可する
    before_action :authenticate_admin!
	def index
		@store_category = StoreCategory.new
		@store_categories = StoreCategory.all
	end

	def create
		if@store_category = StoreCategory.new(store_category_params)
          @store_category.save
		  redirect_to  admin_store_categories_path
		else
		   @store_categories = StoreCategory.all
		   render 'index'
		end
	end

	def edit
		@store_category = StoreCategory.find(params[:id])
	end

	def update
		@store_category = StoreCategory.find(params[:id])
		if @store_category.update(store_category_params)
		   redirect_to  admin_store_categories_path
		else
		 	render 'edit'
		end
	end

	def destroy
		@store_category = StoreCategory.find(params[:id])
		@store_category.destroy
		redirect_to  admin_store_categories_path
	end

    private

    def store_category_params
    	params.require(:store_category).permit(:name)
    end
end
