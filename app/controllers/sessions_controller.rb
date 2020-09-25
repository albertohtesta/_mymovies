class SessionsController < ApplicationController
	def new
		redirect_to home_path if current_user
	end

	def create
		user = User.where(email: params[:email]).first
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to home_path, notice: 'Has ingresado al sistema'
		else
			flash[:error] = 'Email o contraseña invalida'
			redirect_to sign_in_path
		end
	end
	def destroy
		session[:user_id] = nil
		redirect_to root_path, notice: "Has salido del sistema"
	end
end