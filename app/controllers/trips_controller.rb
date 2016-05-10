class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)

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
    params.require(:trip).permit(:name, :description)
  end
end
