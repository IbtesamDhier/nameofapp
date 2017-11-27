require 'rails_helper'

describe UsersController, type: :controller do

	let(:user) { User.create!(first_name: "Ibtesam", last_name: "Dh", email: "g@gmail.com", password: "123456") }
	let(:user2) { User.create!(first_name: "Ilias", last_name: "Dh", email: "l@gmail.com", password: "123456") }

	describe 'GET #show' do
  		context 'when a user is logged in' do
  		   before do 
  		   	sign_in user
  		   end	
		   it 'load correct user detailes' do
         	 get :show, params: { id: user.id }
         	 expect(response).to be_ok
         	 expect(assigns(:user)).to eq user
       	   end
       	   it 'can not access show pages of other users' do
         	 get :show, params: { id: user2.id }
         	 expect(response).to have_http_status(302)
			 expect(response).to redirect_to root_path
       	   end
  		end

  		context 'No user is logged in' do
         it 'redirects to login' do
           get :show, params: { id: user.id }
           expect(response).to redirect_to(new_user_session_path)
         end
		end
	end
end