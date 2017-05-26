class RidesController < ApplicationController

  def create
    @ride = Ride.new(ride_params)
    if @ride.save
      msg = @ride.take_ride
      redirect_to user_path(current_user.id)
      flash[:alert] = msg
    else
      return @ride.errors
    end
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
