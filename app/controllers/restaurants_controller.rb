class RestaurantsController < ApplicationController
	def index
		# byebug
		if params[:query]
			@client = GooglePlaces::Client.new(ENV['API_KEY'])
			@places = @client.spots_by_query(params[:query], :types =>['restaurant', 'food','point_of_interest', 'establishment'], :radius =>params[:distance])

		end
	end


	# def create
	# 	@client = GooglePlaces::Client.new("AIzaSyCr8OKbO02oCu-cz5MvP2JFCoK_rDhgAeY") 
	# 	@restaurant = Restaurant.new
	# 	@restaurant.name = @client.spot(params[:format]).name
	# 	if @client.spot(params[:format]).formatted_address!=nil
	# 		@restaurant.location = @client.spot(params[:format]).formatted_address
	# 	end
	# 	@restaurant.place_id = params[:format]
	# 	@restaurant.save

	# 	if @restaurant.save
	# 		redirect_to restaurant_shortlists_path, method: :post
	# 	else
	# 		render :index
	# 	end
	# end

	def create
		byebug
		@client = GooglePlaces::Client.new(ENV['API_KEY']) 
		@restaurant = Restaurant.find_by_place_id(params[:format])
		# GObject = @client.spot(params[:format])
		if @restaurant ==nil
			@restaurant = Restaurant.new
			@restaurant.name = @client.spot(params[:format]).name
			@restaurant.location =@client.spot(params[:format]).formatted_address
			@restaurant.place_id = @client.spot(params[:format]).place_id
			@restaurant.save
		end
		if @restaurant
			redirect_to new_shortlist_path(@restaurant.id)
		else
			render :index
		end
	end

	



end