class EventsController < ApplicationController

	before_action :authenticate_user!

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
    @event.user_id = current_user.id
    	if @event.save
    		flash[:notice] = "The Event was successfly posted!!"
    		redirect_to events_path
    	else
    		Event.new(event_params)
    		render 'new'
    	end
  	end

	def update
		if @event.update(event_params)
			flash[:notice] = "This Event was successfly updated."
			redirect_to event_path(@event)
   		else
   			flash[:notice] = "Update was failed."
    		redirect_to event_path(@event)
    	end
	end

	def destroy
		if @event.destroy
			flash[:notice] = "The Event '#{@event.title}' was successfly eliminated."
			redirect_to events_path
   		else
   			flash[:notice] = "The elimination was failed."
    		redirect_to event_path(@event)
    	end
		
	end

	def tag_search
		# @selected_tag = tag_search.
		@tagSearch = Event.search(:tags_name_in => [:tags])
		@events = @tagSearch.result(district: true)
	end	

	private

		def set_event
			@event = Event.find(params[:id])
		end
		def event_params
			params.require(:event).permit(:title, :body, :image, :area, :day, :capacity, :tag_list, :user_id, :event_id)
		end

end