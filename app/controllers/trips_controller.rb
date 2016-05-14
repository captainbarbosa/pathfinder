class TripsController < ApplicationController
  before_action :authenticate_user!

  def index
    @trips = current_user.trips
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = current_user.trips.build
  end

  def create
    @trip = current_user.trips.build(trip_params)

    respond_to do |format|
     if @trip.save
       format.html { redirect_to trip_path(id: @trip.id), notice: 'Trip added!' }
     else
       format.html { render action: 'new' }
     end
   end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])

    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to trip_path(id: @trip.id), notice: 'Trip updated' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(:user_id, :name, :description)
  end
end
