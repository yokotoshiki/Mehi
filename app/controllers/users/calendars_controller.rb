class Users::CalendarsController < ApplicationController
  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!
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
     @calendar.update(calendar_params)
     redirect_to users_calendars_path, notice:"レシピを編集しました。"
  end

  def destroy
     @calendar = Calendar.find (params[:id])
     @calendar.destroy
     redirect_to users_calendars_path
  end

  private

  def calendar_params
     params.require(:calendar).permit(:name,  :ingredient, :seasoning, :explanation, :time, :quanitiy, :price, :recipe_id, :user_id, :plan)
  end
end
