class PostsController < ApplicationController
	before_action :set_post,only:[:show,:edit,:update,:destroy]
	def index
		@posts = Post.all
    @posts = Post.page(params[:page]).per(10)
    @user = User.find(current_user)	
  end

	def new
		@post=Post.new
	end

	def create
<<<<<<< HEAD
		@post = Post.new(params.require(:post).permit(:title,:body))
  	@post.save
  	redirect_to post_path(@post.id)
=======
	  @post = Post.new(post_params)
    @post.user_id = current_user.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
>>>>>>> 7d79295f92e03f882b0bcb27d7adec0af8b56db1
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
