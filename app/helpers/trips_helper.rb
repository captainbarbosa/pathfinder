module TripsHelper
  def activities_geojson(trip)
    trip.activities.where("address is NOT NULL").map { |e| e.to_geojson }.to_json
  end
end
