require 'rails_helper'

describe Comment do

  context "testing validation" do
    let(:user) { User.create!(first_name: "Ibtesam", last_name:"Dheir",email: "ig@gmail.com", password: "123456") }

    
	 it "is not valid without a comment body" do
		  expect(Comment.new(rating: 1, user: user)).not_to be_valid
	 end
	 it "is not valid if user doesn't use an integer for rating" do
      expect(Comment.new(rating: "bad", user:user, body:"bad")).not_to be_valid
end
	

  end

end