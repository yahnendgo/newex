class PostsController < ApplicationController

	def show
		@post = Post.find_by_id params[:id]
		@comment = Comment.new
	end

	def index
		@posts = Post.all.order(id: :desc)
	end

	def create
		@post = Post.new post_params
		@post.user = current_user
		@post.save # add flash
		# redirect_to user_path current_user
		respond_to do |format|
			format.js do
				render 'show'
			end
			format.html do 
				redirect_to current_user
			end
		end
	end

	private
	def post_params
		params.require(:post).permit(:title, :subject, :body, :avatar)
	end
end