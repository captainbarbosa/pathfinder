class AddLatLongToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :latitude, :float
    add_column :activities, :longitude, :float
  end
end
