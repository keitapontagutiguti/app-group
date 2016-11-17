class EventsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	before_action :set_event, only: [:show, :edit, :update, :destroy]


	def index
		@search = Event.search(params[:q])
		@events = @search.result(district: true)
		if @events.blank? == true
			flash[:notice] = "No results."
		end
		@events = Event.page(params[:page]).per(10)
	end

	def show
		@comment = Comment.new
  	@event = Event.find(params[:id])
  	@capacity = @event.capacity
	end

	def new
		if user_signed_in?
			@event = Event.new
		else 
			redirect_to new_user_session_path
		end
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
		@tag = params[:id]
		@tagSearch = Event.search(:tags_name_in => [@tag])
		@events = @tagSearch.result(district: true)
	end	

	private

		def set_event
			@event = Event.find(params[:id])
		end
		def event_params
			params.require(:event).permit(:title, :body, :image, :area, :day, :capacity, :tag_list, :tags, :user_id, :event_id)
		end

end