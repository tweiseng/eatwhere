class User < ApplicationRecord
	has_many :shortlists
	has_many :restaurants, through: :shortlists
	
end