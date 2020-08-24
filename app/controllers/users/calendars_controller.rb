class Users::CalendarsController < ApplicationController
  def index
     @calendars = Calendar.all
  end

  def show
     @calendar = Calendar.find(params[:id])
  end

  def new
     @calendar = Calendar.new
  end

  def create
  	 @recipe = Recipe.find(params[:id])
     @calendar = Calendar.new(calendar.params)
     @calender.name = @recipe.name
     @calender.ingredient = @recipe.ingredient
     @calender.seasoning = @recipe.seasoning
     @calender.explanation = @recipe.explanation
     @calender.time = @recipe.time
     @calender.quanitiy = @recipe.quanitiy
     @calender.price = @recipe.price
     @calender.plan = params[:plan]
     @calendar.save
     redirect_to users_calendars_path, notice:"登録しました。"
end

  def edit
     @calendar = Calendar.find(params[:id])
  end

  def update
     @calendar = Calendar.find(params[:id])
     @calendar.user = current_user
     @calendar.update(calendar.params)
     redirect_to users_calender_path(@calendar), notice:"レシピを編集しました。"
  end

  def destroy
     @calendar = Calendar.find (params[:id])
     @calendar.destroy
     redirect_to users_calendars_path
  end

  private

  def recipe_params
     params.require(:recipe).permit(:name, :ingredient, :seasoning, :explanation, :time, :quanitiy, :plan, :price, :recipe_category_id)
  end

  def calendar_params
     params.require(:calendar).permit(:name,  :ingredient, :seasoning, :explanation, :time, :quanitiy, :plan, :price, :recipe_id, :user_id)
  end
end
