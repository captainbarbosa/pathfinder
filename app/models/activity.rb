class Activity < ActiveRecord::Base
  belongs_to :trip

  validates :name, :date, presence: true

  validates :activity_type, inclusion: { in: %w(eat sleep do),
    message: "%{value} is not a valid activity type" }

  geocoded_by :address
  after_validation :geocode, if: ->(obj) { obj.address.present? && obj.address_changed? }

  def to_geojson
    {
      type: 'Feature',
      geometry: {
        type: 'Point',
        coordinates: [longitude, latitude]
      },
      properties: {
        title: name,
        date: date.strftime("%a, %m/%d"),
        'marker-symbol' => 'circle'
      }
    }
  end
end
