class Admin::IngredientCategoriesController < ApplicationController
    # 管理者のみにアクセスを許可する
	before_action :authenticate_admin!

	def index
		@ingredient_category = IngredientCategory.new
		@ingredient_categories = IngredientCategory.all
	end

	def create
		if@ingredient_category = IngredientCategory.new(ingredient_category_params)
          @ingredient_category.save
		  redirect_to  admin_ingredient_categories_path
		else
		   @ingredient_categories = IngredientCategory.all
		   render 'index'
		end
	end

	def edit
		@ingredient_category = IngredientCategory.find(params[:id])
	end

	def update
		@ingredient_category = IngredientCategory.find(params[:id])
		if @ingredient_category.update(ingredient_category_params)
		   redirect_to  admin_ingredient_categories_path
		else
		   render 'edit'
		end
	end

	def destroy
		@ingredient_category = IngredientCategory.find(params[:id])
		@ingredient_category.destroy
		redirect_to  admin_ingredient_categories_path
	end

    private


    def ingredient_category_params
    	params.require(:ingredient_category).permit(:name)
    end
end
