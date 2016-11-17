class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
    @event = Event.where(user_id:@user.id)
  end
 
  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  	if @user.update(user_params)
      redirect_to user_path(@user.id)
    else 
      render :edit
    end
  end
  def tag_search
    @tag = params[:id]
    @tagSearch = Event.search(:tags_name_in => [@tag])
    @events = @tagSearch.result(district: true)
  end 

  private
    def user_params
      params.require(:user).permit(:name, :nationality, :image, :inform)
    end

end
