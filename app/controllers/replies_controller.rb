class RepliesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @reply = @post.replies.create(reply_params)
    redirect_to post_path(params[:post_id])
  end

  def destroy
    Reply.destroy(params[:id])
    redirect_to post_path(params[:post_id])
  end
  private
  def reply_params
  	params.require(:reply).permit(:body)
  end
end