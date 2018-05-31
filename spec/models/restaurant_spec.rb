require 'rails_helper'


RSpec.describe Restaurant, type: :model do
let(:name) {"Sunny Restaurant"}
let(:location){"Some random address"}
let(:restaurant){Restaurant.new(name: name, location: location)}


	describe "correct input types" do
	  context "with valid input" do
	  	it "creates a new Restaurant object" do
	  		expect(restaurant.name).to eq(name)
	  		expect(restaurant.location).to eq(location)
	  	end
	  end

	  context "without valid input" do
	  	it "raises an error without valid inputs" do
	  		expect {@resto = Restaurant.new(name:asdasf, location: "asfsdf")}.to raise_error(NameError)
	  	end
	  end
	end

	describe "attribute not null" do
		context "existence of valid attribute inputs" do
			it "creates Object with given attributes" do
				expect(restaurant.name).to eq(name)
	  			expect(restaurant.location).to eq(location)
	  		end
	  	end

	  	context "lack of input for either of attributes" do
	  		it "will not be able to create the object" do
	  			@resto= Restaurant.new
	  			expect{@resto.save}.to raise_error(ActiveRecord::NotNullViolation)
	  		end
	  	end
	  end
end
