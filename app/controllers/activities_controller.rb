class ActivitiesController < ApplicationController
    def index
      @activities = Activity.all
    end

    def show
      @activity = Activity.find(params[:id])
    end

    def new
      @activity = Activity.new(trip_id: params[:trip_id])
    end

    def create
      @activity = Activity.new(activity_params)

      respond_to do |format|
       if @activity.save
         format.html { redirect_to trip_path(@activity.trip_id), notice: 'Activity added!' }
       else
         format.html { render action: 'new' }
       end
     end
    end

    def edit
      @activity = Activity.find(params[:id])
    end

    def update
      @activity = Activity.find(params[:id])

      respond_to do |format|
        if @activity.update(activity_params)
          format.html { redirect_to trip_path(id: @activity.trip_id), notice: 'Activity updated' }
        else
          format.html { render action: 'edit' }
        end
      end
    end

    def destroy
      @activity = Activity.find(params[:id])
      @activity.destroy
      redirect_to trip_path(@activity.trip_id)
    end

    private

    def activity_params
      params.require(:activity).permit(:trip_id, :name, :date, :description, :address, :location)
    end
end
