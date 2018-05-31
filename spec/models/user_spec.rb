require 'rails_helper'


RSpec.describe User, type: :model do
let(:name){"ali"}
let(:email){"ali@ali.com"}
let(:user){User.new(name: name, email: email)}

describe "correct input types" do
	  context "with valid input" do
	  	it "creates a new User object" do
	  		expect(user.name).to eq(name)
	  		expect(user.email).to eq(email)
	  	end
	  end

	  context "without valid input" do
	  	it "raises an error without valid inputs" do
	  		expect {@human = User.new(name:asdasf, email: "asfsdf")}.to raise_error(NameError)
	  	end
	  end
	end

	describe "attribute not null" do
		context "existence of valid attribute inputs" do
			it "creates Object with given attributes" do
				expect(user.name).to eq(name)
	  			expect(user.email).to eq(email)
	  		end
	  	end

	  	context "lack of input for either of attributes" do
	  		it "will not be able to create the object" do
	  			@human= User.new(name:"", email:"ali@ali.com")
	  			@human.save
	  			expect(@human.id).to be_falsey
	  		end
	  	end
	  end
end