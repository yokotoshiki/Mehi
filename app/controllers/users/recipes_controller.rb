class Users::RecipesController < ApplicationController
  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!, except: [:top,:index,:show, :about]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def top
     @recipes =Recipe.all.order(created_at: :desc).limit(6)
  end

  def about
  end

  def index
    @search = Recipe.ransack(params[:q])
    @recipes = @search.result
    @tags = Tag.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @calendar = Calendar.new
    @tags = Tag.all
  end

  def new
    @recipe = Recipe.new
    @recipe.recipe_ingredients.build
    @recipe.seasonings.build
    @tags = Tag.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if@recipe.save
      params[:recipe][:tag_ids].drop(1).each do |tag_id|
        RecipeTag.create!(recipe_id: @recipe.id , tag_id: tag_id)
      end
       redirect_to users_recipes_path, notice:"レシピを登録しました。"
     else
      @tags = Tag.all
      render 'new'
     end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @tags = Tag.all
  end

  def update
    @recipe = Recipe.find(params[:id])
    if@recipe.update(recipe_params)
      @tags =  @recipe.recipe_tags.destroy_all
      params[:recipe][:tag_ids].drop(1).each do |tag_id|
        RecipeTag.create!(recipe_id: @recipe.id , tag_id: tag_id)
      end
      redirect_to users_recipe_path(@recipe), notice:"レシピを編集しました。"
     else
      render "edit"
     end
  end


  def destroy
     @recipe = Recipe.find(params[:id])
     @recipe.destroy
     redirect_to users_recipes_path
  end

  def collection
       if Rails.env.production?
        @recipes = Recipe.order("RAND()").page(params[:page]).per(1)
      else
        @recipes = Recipe.order("RANDOM()").page(params[:page]).per(1)
      end
  end

  private

  def ensure_correct_user
      @recipe = Recipe.find(params[:id])
    unless @recipe.user == current_user
      redirect_to root_path
    end
  end

  def recipe_params
     params.require(:recipe).permit(
      :name,
      :image,
      :ingredient,
      :seasoning,
      :explanation,
      :time,
      :quanitiy,
      :plan,
      :price,
      :recipe_category_id,
      recipe_ingredients_attributes: [
        :name,
        :quanitiy,
        :id,
        :_destroy
      ],
      seasonings_attributes: [
        :name,
        :quanitiy,
        :id,
        :_destroy
      ]
    )
  end
end

