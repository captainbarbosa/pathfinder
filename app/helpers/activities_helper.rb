module ActivitiesHelper
  def distance_to_next(a, b)
    dist = a.distance_to(b, :mi).round(2)
    "#{dist} miles to next activity" unless dist.nil?
  end
end
