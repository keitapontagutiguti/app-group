class PostsController < ApplicationController
	before_action :set_post,only:[:show,:edit,:update,:destroy]
	def index
			@posts = Post.all
	end

	def new
		@post=Post.new
	end

	def create
		@post = Post.new(params.require(:post).permit(:title,:body))
  		@post.save
  		redirect_to post_path(@post.id)
	end

	def show
		@replies = Reply.where(post_id:@post.id)
		@reply = Reply.new
	end

	def edit
	end

	def update
         @post.title = params[:title]
         @post.body = params[:body]
         @post.save
         redirect_to post_path
	end

	def destroy
    	@post.destroy
    	redirect_to posts_path
	end

	private
	def set_post
		@post = Post.find(params[:id])
	end
	def post_params
		params.require(:post).permit(:title,:body,:interest_list)
	end
end
