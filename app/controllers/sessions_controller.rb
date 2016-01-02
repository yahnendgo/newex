class SessionsController < ApplicationController
	def create
		puts "MY PARAMS"
		pp params
		@user=User.where(username: params[:session][:username]).first
		if @user && @user.password == params[:session][:password]
			flash[:notice] = "You're in!"
			session[:user_id] = @user.id
			redirect_to user_path @user	
		else
			flash[:alert] = "There seems to be a problem, try again."
			redirect_to users_path
		end
	end

	def destroy
		session.delete :user_id
		redirect_to '/index'
	end
end