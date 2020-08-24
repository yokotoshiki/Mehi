class Users::CalendarsController < ApplicationController
  def index
     @calendar = current_user.calendars
  end

  def show
     @recipe = Recipe.find(params[:id])
     @calendar = Calendar.new
  end

  def new
     @recipe = Recipe.find(params[:id])
     @calendar = Calendar.new
  end

  def create
     @recipe = Recipe.find(params[:calendar][:recipe_id])
     current_user.calendars.create!(recipe_id: @recipe.id,plan:params[:calendar][:plan])
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
     params.require(:recipe).permit(:name, :ingredient, :seasoning, :explanation, :time, :quanitiy, :price, :recipe_category_id)
  end

  def calendar_params
     params.require(:calendar).permit(:name,  :ingredient, :seasoning, :explanation, :time, :quanitiy, :price, :recipe_id, :user_id)
  end
end
