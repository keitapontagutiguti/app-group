module UserHelper
   def user_image(user)
   	 if user.image?
   	 	image_tag user.image.url
   	 else
   	 	image_tag "noimage.gif"
   	 end
   end
   def user_gender(user)
   	 if user.gender == 1
   	 	content_tag(:h3, "MEN", class: "user-info-date-M") 
   	 else
   	 	content_tag(:h3, "WOMEN", class: "user-info-date-M") 
     end
   end
end
