class ActivitiesController < ApplicationController

    def index
      @activities = Activity.all
    end

    def show
    end

    def new
      @activity = Activity.new
    end

    def create
      respond_to do |format|
       if @activity.save(activity_params)
         format.html { redirect_to trip_activities_path(id: @activity.id), notice: 'Activity added!' }
       else
         format.html { render action: 'new' }
       end
     end
    end

    def edit
    end

    def update
      respond_to do |format|
        if @activity.update(activity_params)
          format.html { redirect_to trip_activity_path(id: @activity.id), notice: 'Activity updated' }
        else
          format.html { render action: 'edit' }
        end
      end
    end

    def destroy
      @activity.destroy
      redirect_to trip_activities_path
    end

    private

    def activity_params
      params.require(:activity).permit(:trip_id, :name, :date, :description)
    end
end