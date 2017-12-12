require 'rails_helper'

describe Product do

  context "when the product has comments" do
    let(:user1) {FactoryBot.build(:user)}
    let(:user2) {FactoryBot.build(:user)}
    let(:user3) {FactoryBot.build(:user)}
    let(:product) { FactoryBot.build(:product) }

     before do
  		product.comments << FactoryBot.create(:comment, rating: 1, user: user1, product: product)
      product.comments << FactoryBot.create(:comment, rating: 3, user: user2, product: product)
      product.comments << FactoryBot.create(:comment, rating: 5, user: user3, product: product)
     end

  	it "it returns the average rating of all comments" do
  		expect(product.average_rating).to eq 3
	  end

    it "it returns the highest rating of all comments" do
      expect(product.highest_rating_comment.rating).to eq 5
    end

    it "it returns the lowest rating of all comments" do
      expect(product.lowest_rating_comment.rating).to eq 1
    end

    context "product validation" do

      it "product is valid" do
        expect(FactoryBot.build(:product)).to be_valid
      end

	    it "it is not valid without a name" do
		    expect(FactoryBot.build(:product, name: nil)).not_to be_valid
	    end

      it "it is not valid without a price" do
        expect(FactoryBot.build(:product, price: nil)).not_to be_valid
      end
    end
  end
end