require 'rails_helper'

describe ProductsController, type: :controller do

#================== index action ===================#
  context "GET #index" do
	 it "renders the index Product template" do
    get :index
    expect(response).to be_success
    expect(response).to have_http_status(200)
    expect(response).to render_template ('index')
   end
 end

 #================== show action ===================#
context "GET #show" do
  let(:product) {FactoryBot.create(:product)}
   it "load current product details" do
    get :show, params: { id: product.id } 
    expect(response).to be_ok
    expect(response).to render_template ('show')
   end
end

 #================== new action ===================#
describe "GET #new" do
  subject { get :new }
  context "when user is logged in" do
    before { sign_in user}
    context "when it is an admin" do
      let(:user) { FactoryBot.create(:admin) }
      it "renders the new Product template" do
        expect(subject).to render_template ('new')
      end
    end

    context 'when it is a normal user' do
      let(:user) {FactoryBot.create(:user)}
      it "redirect to root" do
        expect(subject).to redirect_to (root_path)
      end
    end
  end

  context "when user is not logged in" do
    it "redirect to login template" do
    expect(subject).to redirect_to (new_user_session_path)
   end
  end
end

 #================== edit action ===================#
describe "GET #edit" do
  let(:product) { FactoryBot.create(:product) }
  subject {
    get :edit, params: { id: product.id } 
  }

  context "when user is logged in" do
    before { sign_in user }
    context "when he is an admin" do
      let(:user) { FactoryBot.create(:admin) }
      it "renders the edit Product template" do
        expect(subject).to be_ok
        expect(subject).to render_template ('edit')
      end
    end

    context "when he is a normal user" do 
      let(:user) { FactoryBot.create(:user) }
      it "redirect to root" do
        expect(subject).to redirect_to (root_path)
      end
    end
  end

  context "when user is not logged in" do
    it "redirect to login template" do
      expect(subject).to redirect_to (new_user_session_path)
    end
  end
end

 #================== create action ===================#
describe "POST #create" do
  subject {
    post :create, params: { product: { name: 'product #1', description: '', image_url: '' ,price: 500, colour: ''}       } 
  }
  context "when user is logged in" do
    before { sign_in user}
    context "when he is an admin" do
      let(:user) { FactoryBot.create(:admin) }
      it "redirect to Product page " do
        expect(subject).to redirect_to product_path(Product.last.id)
      end
    end
    context "when he is a normal user" do
      let(:user) { FactoryBot.create(:user) }
      it "redirect to root " do
        expect(subject).to redirect_to (root_path)
      end
    end
  end
  context "when user is not logged in" do
    it "redirect to login template" do
      expect(subject).to redirect_to (new_user_session_path)
    end
  end
end

 #================== update action ===================#
 describe "PUT #update" do
  subject {
    put :update, params: { id: @product.id, product: { name: 'product #1', description: '', image_url: '' ,price: 500, colour: ''}       } 
  }
  
  context "when user is logged in" do
    before do
      @product = FactoryBot.create(:product) 
      @admin = FactoryBot.create(:admin)
      @user = FactoryBot.create(:user)
    end

    it "redirect to Products page if he's an admin" do
      sign_in @admin
      expect(subject).to redirect_to product_path(@product.id)
    end
    it "redirect to root if he's not admin" do
      sign_in @user
      expect(subject).to redirect_to (root_path)
   end
  end

  context "when user is not logged in" do
    before do 
      @product =FactoryBot.create(:product)
    end
    it "redirect to login template" do
    expect(subject).to redirect_to (new_user_session_path)
   end
  end
 end

 #================== destroy action ===================#

 describe "DELETE #destroy" do
 
  context "when user is logged in" do
    before do
      @product =FactoryBot.create(:product)
      @admin = FactoryBot.create(:admin)
      @user = FactoryBot.create(:user)
    end

    it "redirects to Product template if he's an admin" do
      sign_in @admin
      delete :destroy, params: { id: @product.id }
      expect(response).to redirect_to products_path
   end

   it "redirects to root if he's not admin" do
    sign_in @user
    delete :destroy, params: { id: @product.id }
    expect(response).to redirect_to (root_path)
   end
  end

  context "when user is not logged in" do
    before do 
      @product =FactoryBot.create(:product)
    end
    it "redirects to login template" do
    delete :destroy, params: { id: @product.id } 
    expect(response).to redirect_to (new_user_session_path)
   end
  end  
 end
end