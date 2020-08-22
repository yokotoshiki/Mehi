class Users::IngredientsController < ApplicationController

	def index
		@ingredients = Ingredient.all
	end

	def show
		@ingredient = Ingredient.find(params[:id])
    end

    def new
    	@ingredient = Ingredient.new
    end

    def create
    	@ingredient = Ingredient.new(ingredient_params)
    	@ingredient.user = current_user
    	@ingredient.save
    	redirect_to users_ingredients_path
    end

    def edit
    	@ingredient = Ingredient.find(params[:id])
    end

    def update
    	@ingredient = Ingredient.find(params[:id])
    	@ingredient.update(ingredient_params)
    	redirect_to users_ingredients_path
    end

    def destory
    	@ingredient = Ingredient.find(params[:id])
    	@ingredient.destory
    	redirect_to users_ingredients_path
    end

    private

        def ingredient_params
        	params.require(:ingredient).permit(:name, :quanitiy, :note, :expiration_date, :ingredient_category_id )
        end


end
