class ShortlistsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
		# byebug
		if params[:query]&&params[:query]!=""
			@list = ShortList.where(user_id: cookies[:uid])
			@list = @list.where(restaurant_id: Restaurant.where(name: params[:query])[0].id)
		elsif params[:query]&&params[:query]==""
			@list = ShortList.where(user_id: cookies[:uid])
		else
			@list = ShortList.where(user_id: cookies[:uid])
		end			
	end

	def new
		# byebug
		@restaurant = Restaurant.find(params[:format])
	end

	def create
		# byebug
		@list = ShortList.new
		@list.user_id = cookies[:uid]
		@list.restaurant_id = params[:format] 
		@list.save
		flash[:notice] = "Your selection has been saved"
		redirect_to shortlists_path
	end

	def destroy
		@list = ShortList.find(params[:id])
		@list.destroy
		redirect_to shortlists_path
	end

	def search
		# byebug
		# @list = ShortList.where('name LIKE?', "%#{params[:query]}%")
		@list = ShortList.where(user_id: cookies[:uid])
		@restaurant =[]
		for i in @list do
			@restaurant<<i.restaurant
		end
		respond_to do|format|
			format.json{render json:@restaurant}
		end
	end
		
end
