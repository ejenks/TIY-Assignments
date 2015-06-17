class CommentsController < ApplicationController


	def edit
	  @post = Post.find(params[:post_id])
	  # @comment = @post.comments.find(params[:post_id])
	end

	def update
	  @post = Post.find(params[:post_id])
	  @comment = @post.comments.update(comment_params)
	  if @comment.save
	  	redirect_to post_path(@post)
	  else
	  	render 'edit'
	  end
	end

	def create
	  @post = Post.find(params[:post_id])
	  @comment = @post.comments.create(comment_params)

	  redirect_to post_path(@post)
	end

	def destroy
	  @post = Post.find(params[:post_id])
	  @comment = @post.comments.find(params[:id])
	  @comment.destroy
	  redirect_to post_path(@post)

	end

	private

	def comment_params
	  params.require(:comment).permit(:comment_author, :comment)
	end

end
