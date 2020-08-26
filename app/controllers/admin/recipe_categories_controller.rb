class Admin::RecipeCategoriesController < ApplicationController

   # 管理者のみにアクセスを許可する
	before_action :authenticate_admin!

	def index
		@recipe_category = RecipeCategory.new
		@recipe_categories = RecipeCategory.all
	end

	def create
		if@recipe_category = RecipeCategory.new(recipe_category_params)
          @recipe_category.save
		  redirect_to  admin_recipe_categories_path
		else
		   @recipe_categories = RecipeCategory.all
		   render 'index'
		end
	end

	def edit
		@recipe_category = RecipeCategory.find(params[:id])
	end

	def update
		@recipe_category = RecipeCategory.find(params[:id])
		if @recipe_category.update(recipe_category_params)
		   redirect_to  admin_recipe_categories_path
		 else
		 	render 'edit'
		 end
	end

	def destroy
		@recipe_category = RecipeCategory.find(params[:id])
		@recipe_category.destroy
		redirect_to  admin_recipe_categories_path
	end

    private

    def recipe_category_params
    	params.require(:recipe_category).permit(:name)
    end

end
