class CommentsController < ApplicationController
	before_action :authenticate_user!

	def add_comment
		@post = Post.friendly.find(params[:post_id])
		@commentor = current_user
		@comment = Comment.build_from( @post, @commentor.id, params[:body] )

		if @comment.save
			respond_to	do |format|
				format.html { redirect_to @post, notice: 'Comment was successfully created.' }
				format.json { render json: @comment, status: :success, location: @post }
				format.js
			end
		else
			respond_to	do |format|
				format.html { redirect_to @post, flash: { error: "An error occured while creating comment" } }
				format.json { render json: @comment.errors, status: :unprocessable_entity }
				format.js
			end
		end
	end

	def add_child_comment
		@parent = Comment.find(params[:parent_id])
		@comment = Comment.build_from( @parent.commentable, current_user.id, params[:body])

		if @comment.save
			@comment.move_to_child_of(@parent)

			respond_to	do |format|
				format.html { redirect_to @parent.commentable, notice: 'Reply was successfully created.' }
				format.json { render json: @comment, status: :success, location: @post }
				format.js
			end
		else
			respond_to	do |format|
				format.html { redirect_to @parent.commentable, flash: { error: "An error occured while creating reply" } }
				format.json { render json: @comment.errors, status: :unprocessable_entity }
				format.js
			end
		end
	end

	def remove_comment
		
	end

	def remove_child_comment
		
	end
end
