module UserHelper
   def user_image(user)
   	 if user.image?
   	 	image_tag user.image.url
   	 else
   	 	image_tag "noimage.gif"
   	 end
   end
end
