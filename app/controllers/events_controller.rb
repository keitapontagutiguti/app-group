class EventsController < ApplicationController

	# before_action :authenticate_user!

	before_action :set_event, only: [:show, :edit, :update, :destroy]

	def index
		@events = Event.all
		@search = Event.search(params[:q])
		@events = @search.result(district: true)
	end

	def show
		@comment = Comment.new
	end

	def new
		@event = Event.new
	end

	def edit

	end

	def create
		@event = Event.new(event_params)
    if @event.save
    	redirect_to events_path
    	flash[:notice] = "The Event was successfly posted!!"
    else
    	Event.new(event_params)
    	render 'new'
    end
  end

	def update
		if @event.update(event_params)
			redirect_to event_path(@event)
    	flash[:notice] = "This Event was updated."
    else
    	redirect_to event_path(@event)
    	flash[:notice] = "Update was failed."
    end
	end

	def destroy
		@event.destroy
		redirect_to events_path
	end
	
	private

		def set_event
			@event = Event.find(params[:id])
		end
		def event_params
			params.require(:event).permit(:title, :body, :image, :area, :day, :capacity, :tag_list)
		end

end