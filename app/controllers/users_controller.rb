class UsersController < ApplicationController

	def index
		@users = User.all
	end
	def show
		@user = User.find params[:id]
		@post = Post.new
		@top_three_posts = @user.posts.order(id: :desc).limit 3
	end

	def posts
		@user = User.find params[:id]
		@posts = @user.posts.order(id: :desc)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "Account Created!"
			redirect_to '/index'
		else
			flash.now[:alert] = "There was a problem creating your account"
			render :new
		end
	end
	
	def destroy
		@user = User.find params[:id]
		@user.destroy
		redirect_to '/index'
	end

	def edit
		@user = User.find params[:id]
	end

	def update
		@user = User.find params[:id]
		if @user.update_attributes user_params
			flash[:notice] = "Got it now!"
			redirect_to '/users'
		else
			flash[:alert] = "Something's wrong... Try again."
			redirect_to edit_user_path @user
		end
	end

	private
	def user_params
		params.require(:user).permit(:fname, :lname, :gender, :age, :email, :city, :country, :avatar, :username, :password, :password_confirmation)
	end

end