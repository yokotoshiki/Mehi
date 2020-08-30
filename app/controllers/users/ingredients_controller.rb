class Users::IngredientsController < ApplicationController
   # ログイン済ユーザーのみにアクセスを許可する
   before_action :authenticate_user!
   before_action :ensure_correct_user, only: [:edit, :update, :destroy]
	def index
		@ingredients = current_user.ingredients
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


    def destroy
        @ingredient = Ingredient.find (params[:id])
        @ingredient.destroy
        redirect_to users_ingredients_path
    end

    private

    def ensure_correct_user
       @ingredient = Ingredient.find(params[:id])
       unless @ingredient.user == current_user
       redirect_to root_path
      end
    end

    def ingredient_params
        params.require(:ingredient).permit(:name, :quanitiy, :note, :expiration_date, :ingredient_category_id )
    end


end
