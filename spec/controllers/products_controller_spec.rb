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
  let(:admin) {FactoryBot.create(:admin)}
  let(:user) {FactoryBot.create(:user)}

  context "when user is logged in" do

    it "renders the new Product template if he's an admin" do
    sign_in admin
    get :new
    expect(response).to render_template ('new')
   end

   it "redirect to root if he's not admin" do
    sign_in user
    get :new
    expect(response).to redirect_to (root_path)
   end
  end

  context "when user is not logged in" do
    it "redirect to login template" do
    get :new
    expect(response).to redirect_to (new_user_session_path)
   end
  end
 end

 #================== edit action ===================#
 describe "GET #edit" do
  let(:product) {FactoryBot.create(:product)}
  let(:admin) {FactoryBot.create(:admin)}
  let(:user) {FactoryBot.create(:user)}

  context "when user is logged in" do
    it "renders the edit Product template if he's an admin" do
      sign_in admin
      get :edit, params: { id: product.id } 
      expect(response).to be_ok
      expect(response).to render_template ('edit')
   end

   it "redirect to root if he's not admin" do
    sign_in user
    get :edit, params: { id: product.id } 
    expect(response).to redirect_to (root_path)
   end
  end

  context "when user is not logged in" do
    it "redirect to login template" do
    get :edit, params: { id: product.id } 
    expect(response).to redirect_to (new_user_session_path)
   end
  end

 end

 #================== create action ===================#
 describe "POST #create" do
  
  context "when user is logged in" do
    before do
      @admin = FactoryBot.create(:admin)
      @user = FactoryBot.create(:user)
    end


    it "redirect to Product page if he's an admin" do
      sign_in @admin
      post :create, params: { product: { name: 'product #1', description: '', image_url: '' ,price: 500, colour: ''}       } 
      expect(response).to redirect_to product_path(Product.last.id)
    end
    it "redirect to root if he's not admin" do
      sign_in @user
      post :create, params: { product: { name: 'product #1', description: '', image_url: '' ,price: 500, colour: ''}       } 
      expect(response).to redirect_to (root_path)
   end
  end
  context "when user is not logged in" do
    it "redirect to login template" do
    post :create, params: { product: { name: 'product #1', description: '', image_url: '' ,price: 500, colour: ''}       } 
    expect(response).to redirect_to (new_user_session_path)
   end
  end
 end

 #================== update action ===================#
 describe "PUT #update" do
  
  context "when user is logged in" do
    before do
      @product = FactoryBot.create(:product) 
      @admin = FactoryBot.create(:admin)
      @user = FactoryBot.create(:user)
    end

    it "redirect to Products page if he's an admin" do
      sign_in @admin
      put :update, params: { id: @product.id, product: { name: 'product #1', description: '', image_url: '' ,price: 500, colour: ''}       } 
      expect(response).to redirect_to product_path(@product.id)
    end
    it "redirect to root if he's not admin" do
      sign_in @user
      put :update, params: { id: @product.id, product: { name: 'product #1', description: '', image_url: '' ,price: 500, colour: ''}       } 
      expect(response).to redirect_to (root_path)
   end
  end

  context "when user is not logged in" do
    before do 
      @product =FactoryBot.create(:product)
    end
    it "redirect to login template" do
    put :update, params: { id: @product.id, product: { name: 'product #1', description: '', image_url: '' ,price: 500, colour: ''}       } 
    expect(response).to redirect_to (new_user_session_path)
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