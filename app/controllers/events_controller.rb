class EventsController < ApplicationController

	# before_action :authenticate_user!

	before_action :set_event, only: [:show, :edit, :update, :destroy]

	def index
		@events = Event.all
	end

	def show
		
	end

	def new
		@event = Event.new
	end

	def edit

	end

	def create
		@event = Event.new(event_params)
    @event.save
    redirect_to events_path
  end

	def update
		
	end

	def destroy
		
	end

	private

		def set_event
			@event = Event.find(params[:id])
		end
		def event_params
			params.require(:event).permit(:title, :body, :image, :area, :day, :capacity)
		end

end