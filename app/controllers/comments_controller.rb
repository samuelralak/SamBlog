class CommentsController < ApplicationController
	before_action :authenticate_user!

	def add_comment
		@post = Post.friendly.find(params[:post_id])
		@commentor = current_user
		@comment = Comment.build_from( @post, @commentor.id, params[:body] )

		if @comment.save
			respond_to	do |format|
				format.html { redirect_to post_path(@post) }
				format.json { render json: @comment, status: :success }
			end
		else
			respond_to	do |format|
				format.html { redirect_to post_path(@post) }
				format.json { render json: @comment.errors, status: :unprocessable_entity }
			end
		end
	end

	def add_child_comment
		
	end

	def remove_comment
		
	end

	def remove_child_comment
		
	end
end
