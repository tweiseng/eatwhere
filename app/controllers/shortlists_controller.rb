class ShortlistsController < ApplicationController
	def index
		byebug
		@list = ShortList.where(user_id: cookies[:uid])
		@selections = Restaurant.where(id: @list.restaurant_id)
	end

	def new
		byebug
		@restaurant = Restaurant.find(params[:restaurant_id])
	end

	def create
		byebug
		@list = ShortList.new
		@list.user_id = cookies[:uid]
		@list.restaurant_id = params[:restaurant_id] 
		@list.save
		flash[:notice] = "Your selection has been saved"
		redirect_to restaurant_shortlists_path
	end
end
