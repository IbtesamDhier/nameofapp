require 'rails_helper'

describe Comment do

  context "testing validation" do
    let(:user) {FactoryBot.build(:user)}
    let(:product) { FactoryBot.build(:product) }
    
	 it "is valid comment" do
		expect(FactoryBot.build(:comment, product: product, user: user)).to be_valid
	 end

	 it "is not valid without comment body" do
		expect(FactoryBot.build(:comment, body: nil, product: product, user: user)).not_to be_valid
     end

     it "is not valid without comment rating" do
		expect(FactoryBot.build(:comment, rating: nil, product: product, user: user)).not_to be_valid
     end


     it "is not valid without user" do
		expect(FactoryBot.build(:comment, product: product, user: nil)).not_to be_valid
     end

	 it "is not valid if user doesn't use an integer for rating" do
		expect(FactoryBot.build(:comment, rating: "bad", product: product, user: user)).not_to be_valid
     end
  end
end