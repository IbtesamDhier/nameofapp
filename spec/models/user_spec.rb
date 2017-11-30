require 'rails_helper'

describe User do

  context "testing validation" do
    
	 it "is not valid without a password" do
		  expect(FactoryBot.build(:user,first_name:"Alaa", last_name: "f", password:nil)).not_to be_valid
	 end


  it "should not validate users without an email address" do
    @user = FactoryBot.build(:user, email: "not_an_email")
    expect(@user).to_not be_valid
  end
	

  end

end