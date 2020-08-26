class Admin::TagsController < ApplicationController
    # 管理者のみにアクセスを許可する
	before_action :authenticate_admin!
	def index
		@tag = Tag.new
		@tags = Tag.all
	end

	def create
		if@tag= Tag.new(tag_params)
          @tag.save
		  redirect_to  admin_tags_path
		else
		   @tags = tag.all
		   render 'index'
		end
	end

	def edit
		@tag = Tag.find(params[:id])
	end

	def update
		@tag = Tag.find(params[:id])
		if @tag.update(tag_params)
		   redirect_to  admin_tas_path
		else
		 	render 'edit'
		end
	end

	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy
		redirect_to  admin_tags_path
	end

    private

    def tag_params
    	params.require(:tag).permit(:tag_name)
    end
end
