require 'rails_helper'

describe User do

  context "when creating a user" do

    it "it is valid with 6 character password and email address" do
      expect(FactoryBot.build(:user)).to be_valid
    end
    
	  it "it is not valid without a password" do
		  expect(FactoryBot.build(:user, password:nil)).not_to be_valid
	  end

    it "it is not valid without an email address" do
      expect(FactoryBot.build(:user, email: nil)).to_not be_valid
    end

    it "it is not valid with 5 character password" do
      expect(FactoryBot.build(:user, password: '12345')).to_not be_valid
    end
  end
end