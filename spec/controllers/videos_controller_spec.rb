require 'rails_helper'

describe VideosController do
	describe "GET show" do
			it "sets @video for authenticated users" do
				session[:user_id]=Fabricate(:user).id
				video = Fabricate(:video)
				get :show, :params => { :id => video.id }
				expect(@controller.instance_variable_get(:@video)).to eq(video)
			end

			it "sets @reviews for authenticated users" do
				session[:user_id]=Fabricate(:user).id
				video = Fabricate(:video)
				review1 = Fabricate(:review, video: video)
				review2 = Fabricate(:review, video: video)
				get :show, :params => { :id => video.id }
				expect(assigns(:reviews)).to match_array([review1, review2])
				assigns(:reviews).should =~ [review1, review2]

			end

			it "redirects the user to the sign in page for unauthenticated users" do
				video = Fabricate(:video)
				get :show, :params => { :id => video.id }
				expect(response).to redirect_to sign_in_path
			end
	end

	describe "POST search" do
		it "sets @results for authenticated users" do
			session[:user_id] = Fabricate(:user).id
			futurama = Fabricate(:video, title: 'futurama')
			post :search, :params => { :search_term => 'rama'}
			expect(@controller.instance_variable_get(:@results)).to eq([futurama])
		end
		it "redirects to sign in page for the un authenticated users" do
			futurama = Fabricate(:video, title: 'futurama')
			post :search, :params => { :search_term => 'rama'}
			expect(response).to redirect_to sign_in_path
		end
	end
end

=begin otra opcion de spec
describe VideosController do
	describe "GET show" do
		context "with authenticated users" do
			before do
				session[:user_id]=Fabricate(:user).id
			end
			it "sets @video" do
				video = Fabricate(:video)
				get :show, :params => { :id => video.id }
				expect(@controller.instance_variable_get(:@video)).to eq(video)
			end
		end
		context "with un authenticated user" do
			it "redirects the user to the sign in page" do
				video = Fabricate(:video)
				get :show, :params => { :id => video.id }
				expect(response).to redirect_to sign_in_path
			end
		end
	end
end
=end