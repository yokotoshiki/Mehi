class Admin::IngreduentCategoriesController < ApplicationController

   	def index
		@ingredient_category = IngreduentCategory.new
		@ingredient_categories = IngreduentCategory.all
	end

	def create
		if@ingredient_category = IngreduentCategory.new(ingredient_category_params)
          @ingredient_category.save
		  redirect_to  admin_ingredient_categories_path
		else
		   @ingredient_categories = IngreduentCategory.all
		   render 'index'
		end
	end

	def edit
		@ingredient_category = IngreduentCategory.find(params[:id])
	end

	def update
		@ingredient_category = IngreduentCategory.find(params[:id])
		if @ingredient_category.update(ingredient_category_params)
		   redirect_to  admin_ingredient_categories_path
		 else
		 	render 'edit'
		 end
	end

	def destroy
		@ingredient_category = IngreduentCategory.find(params[:id])
		@ingredient_category.destroy
		redirect_to  admin_ingredient_categories_path
	end

    private

    def ingredient_category_params
    	params.require(:ingredient_category).permit(:name)
    end
end
