class Activity < ActiveRecord::Base
  belongs_to :trip

  validates :name, :date, presence: true

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
