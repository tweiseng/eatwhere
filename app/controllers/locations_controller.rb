class LocationsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def new
	end

	def index
		@locations = Location.all
	end

	def create
		
		@location = Location.new
		@location.name = params[:location][:name]
		@location.save

		# redirect_to locations_path
		respond_to do|format|
			if @location.save
				format.html{redirect_to locations_path, notice:'location saved!'}
				format.json{render :locations}
			else
				format.html{render :new, notice: 'something went wrong, please try again'}
				format.json{render :new}
			end
		end			
	end

	def delete
		
		@location = Location.find(params[:id])
		@location.destroy
		flash[:notice] ='Town/City removed'
		redirect_to locations_path
	end

	def search
		@location = Location.all
		respond_to do|format|
			format.json{render json: @location}
		end
	end
end