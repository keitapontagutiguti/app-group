class BaseController < ApplicationController

	def top
		@show = Post.order("RANDOM()").last(10)
	end

end
