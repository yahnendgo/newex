class CommentsController < ApplicationController
	def create
		@comment = Comment.new params[:comment]
		@comment.post_id = params[:post_id]
		@comment.user = current_user
		@comment.save
		redirect_to post_path params[:post_id]
	end

	def destroy
		@comment = Comment.find params[:id]
		@comment.destroy
		render json: { message: 'Success!' }
	end	
end