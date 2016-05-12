class RemoveLocationsFromActivities < ActiveRecord::Migration
  def change
    remove_column(:activities, :location)
  end
end
