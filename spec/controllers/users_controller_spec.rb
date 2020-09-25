require 'rails_helper'

describe UsersController do 

	describe "GET new" do
		it "sets @user" do
			get :new
			expect(@controller.instance_variable_get(:@user)).to be_instance_of(User)
		end
	end

	describe "POST create" do
		context "with valid input" do
			before {post :create, :params => { :user => Fabricate.attributes_for(:user)}}
			it "creates the user" do
				expect(User.count).to eq(1)
			end
			it "redirects to the sign in page" do
				expect(response).to redirect_to sign_in_path
			end
		end
		context "with invalid input" do
			before {post :create, :params => { :user => {password: "password", full_name: "Albert Hdez" }}}
			it "does not create the user" do
				expect(User.count).to eq(0)
			end
			it "render the :new template" do
				expect(response).to render_template :new

			end
			it "sets @user" do
				expect(@controller.instance_variable_get(:@user)).to be_instance_of(User)
			end
		end
	end
end