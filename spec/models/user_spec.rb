require 'rails_helper'

describe User do

  context "testing validation" do
    
	 it "is not valid without a password" do
		  expect(User.new(first_name: "Ibtesam", last_name:"Dheir",email: "ig@gmail.com")).not_to be_valid
	 end

   it "is not valid without an email" do
      expect(User.new(first_name: "Ibtesam", last_name:"Dheir", password: "123456")).not_to be_valid
   end

   it "is not valid without a last_name" do
      expect(User.new(last_name:nil)).not_to be_valid
   end
	

  end

end