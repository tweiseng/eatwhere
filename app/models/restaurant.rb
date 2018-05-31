class Restaurant < ApplicationRecord
	# geocoded_by :location
	has_many :users, through: :shortlists

	# def self.create(GooglePlacesSpotObject)
	# 	byebug
	# 	self.new(name: GooglePlacesSpotObject.name,
	# 		place_id: GooglePlacesSpotObject.place_id,
	# 		location: GooglePlacesSpotObject.formatted_address
	# 		)
	# end
end
