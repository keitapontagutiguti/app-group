class BaseController < ApplicationController

	def top
		@random_posts = Post.order("RANDOM()").last(10)
	end

end
