class JoinsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @join = current_user.joins.build(event: @event)

    @join.save
      redirect_to event_path(@event), notice: "参加できました"
  end

  def destroy
    @join = current_user.joins.find_by!(event_id:params[:event_id])
    @join.destroy
      redirect_to events_path(@event), notice: "お気に入りを解除しました"
    end
end





