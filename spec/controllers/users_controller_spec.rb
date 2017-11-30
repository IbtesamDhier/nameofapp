require 'rails_helper'


describe UsersController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
  end

#================== index action ===================#
  describe "GET #index" do
  	context "when user is logged in" do
  	  it "renders user index template " do
        get :index
        expect(response).to have_http_status(200)
        expect(response).to render_template ('index')
      end
  	end
  end
#====================== show action =====================#
  describe 'GET #show' do
    context 'when a user is logged in' do
      before do
          sign_in @user
      end

      it "loads correct user details" do
        get :show, params: { id: @user.id }
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user
      end

      it 'can not access show pages of other users' do
        get :show, params: { id: @user2.id }
        expect(response).to have_http_status(302)
		expect(response).to redirect_to root_path
	  end
    end

  	context 'when a user is not logged in' do
      it 'redirects to login' do
        get :show, params: { id: @user.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

#==================== create action =====================#

  describe "POST #create" do
  
  context "when user is logged in" do
    before do
      @admin = FactoryBot.create(:admin)
      @user = FactoryBot.create(:user)
    end


    it "redirect to user page if he's an admin" do
      sign_in @admin
      post :create, params: { user: { first_name: '', last_name: '', email: '' ,password: ''}       } 
      expect(response).to be_ok
    end
    it "redirect to root if he's not admin" do
      sign_in @user
      post :create, params: { user: { first_name: '', last_name: '', email: '' ,password: ''}       } 
      expect(response).to redirect_to (root_path)
   end
  end
  context "when user is not logged in" do
    it "redirect to login template" do
      post :create, params: { user: { first_name: '', last_name: '', email: '' ,password: ''}       } 
    expect(response).to redirect_to (new_user_session_path)
   end
  end
 end

  #==================== new action =======================#
 describe "GET #new" do
  let(:admin) {FactoryBot.create(:admin)}
  let(:user) {FactoryBot.create(:user)}

  context "when user is logged in" do

    it "renders the new user template if he's an admin" do
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

 #================== destroy action ===================#
describe "DELETE #destroy" do
 
  context "when user is logged in" do
    before do
      @admin = FactoryBot.create(:admin)
      @user = FactoryBot.create(:user)
    end

    it "redirects to the user template if he's an admin" do
      sign_in @admin
      delete :destroy, params: { id: @user.id }
      expect(response).to redirect_to users_path
   end

   it "redirects to root if he's not admin" do
    sign_in @user
    delete :destroy, params: { id: @user.id }
    expect(response).to redirect_to (root_path)
   end
  end

  context "when user is not logged in" do
    before do 
      @user =FactoryBot.create(:user)
    end
    it "redirects to login template" do
    delete :destroy, params: { id: @user.id } 
    expect(response).to redirect_to (new_user_session_path)
   end
  end  
end
 
end