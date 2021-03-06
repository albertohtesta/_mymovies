class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = 'Ha sido registrado!'
			redirect_to sign_in_path
		else
			render :new
		end
	end

	private

	def user_params
		params.require(:user).permit(:email, :password, :full_name)
	end

end