class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def create
    respond_to do |format|
     if @trip.save(trip_params)
       format.html { redirect_to trip_path(id: @trip.id), notice: 'Trip added!' }
     else
       format.html { render action: 'new' }
     end
   end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to trip_path(id: @trip.id), notice: 'Trip updated' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_path
  end

  private

  def interaction_params
    params.require(:trip).permit(:name, :description)
  end
end
