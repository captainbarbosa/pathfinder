class AddPointsToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :location, :point
  end
end
