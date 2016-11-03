class CommentsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.create(comment_params)
    if @comment.save
      redirect_to event_path(@event),notice:"投稿OK"
    else
      redirect_to event_path(@event),alert:"無理"
    end
  end
  def new
    @comment = Comment.new
  end
  def index
    @comments = Comment.all
  end

  def show

  end
  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
