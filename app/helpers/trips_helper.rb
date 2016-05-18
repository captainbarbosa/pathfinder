module TripsHelper
  def activities_geojson(trip)
    trip.activities.where("address is NOT NULL").map { |e| e.to_geojson }.to_json
  end

  def date_range(trip)
    dates = trip.activities.pluck(:date)
    max_date = dates.max_by { |x| x }
    min_date = dates.min_by { |x| x }
    { start_date: min_date, end_date: max_date }
  end
end
