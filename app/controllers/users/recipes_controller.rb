class Users::RecipesController < ApplicationController
  def top
      @recipe =Recipe.all
  end
  def index
      @recipes = Recipe.all
  end

  def show
     @recipe = Recipe.find(params[:id])
     @recipe = Recipe.new
  end

  def new
     @recipe = Recipe.new
  end

  def create
     @recipe = Recipe.new(recipe_params)
     @recipe.save
     redirect_to users_users_path, notice:"レシピを登録しました。"
  end

  def edit
     @recipe = Recipe.find(params[:id])
  end

  def update
     @recipe = Recipe.find(params[:id])
     @recipe.update(recipe.params)
     redirect_to users_user_path(@recipe), notice:"レシピを編集しました。"
  end

  def destroy
     @recipe = Recipe.find (params[:id])
     @recipe.destroy
     redirect_to users_users_path
  end

  private

  def recipe_params
     params.require(:recipe).permit(:name, :image_id, :ingredient, :seasoning, :explanation, :time, :quanitiy, :plan, :price)
  end
end
