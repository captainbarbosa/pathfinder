module ActivitiesHelper
  def distance_to_next(a, b)
    a.distance_to(b, :mi).round(2)
  end
end
