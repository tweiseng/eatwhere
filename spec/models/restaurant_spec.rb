require 'rails_helper'


RSpec.describe Restaurant, type: :model do
let(:name) {"Sunny Restaurant"}
let(:restaurant){Restaurant.new(name: name)}

	describe "#initialize" do
	  context "with valid input" do
	  	it "creates a new Restaurant object" do
	  		expect(restaurant.name).to eq(name)
	  	end
	  end
	end
end
