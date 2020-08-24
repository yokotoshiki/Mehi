class Users::RecipesController < ApplicationController
  def top
     @recipes =Recipe.all
  end
  def index
     @recipes = Recipe.all
  end

  def show
     @recipe = Recipe.find(params[:id])
     @calendar = Calendar.new
     @tags = Tag.all
  end

  def new
     @recipe = Recipe.new
     @tags = Tag.all
  end

  def create
     @recipe = Recipe.new(recipe_params)
     @recipe.user = current_user
     @recipe.save
     params[:recipe][:tag_ids].drop(1).each do |tag_id|
       RecipeTag.create!(recipe_id: @recipe.id , tag_id: tag_id)
     end
     redirect_to users_recipes_path, notice:"レシピを登録しました。"
  end

  def edit
     @recipe = Recipe.find(params[:id])
  end

  def update
     @recipe = Recipe.find(params[:id])
     @recipe.user = current_user
     @recipe.update(recipe_params)
     redirect_to users_recipe_path(@recipe), notice:"レシピを編集しました。"
  end


  def destroy
     @recipe = Recipe.find(params[:id])
     @recipe.destroy
     redirect_to users_recipes_path
  end

  private

  def recipe_params
     params.require(:recipe).permit(:name, :image, :ingredient, :seasoning, :explanation, :time, :quanitiy, :plan, :price, :recipe_category_id)
  end
end
