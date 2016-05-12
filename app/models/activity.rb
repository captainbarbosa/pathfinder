class Activity < ActiveRecord::Base
  belongs_to :trip

  validates :name, :date, presence: true

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  def to_geojson
    {
      type: 'Feature',
      geometry: {
        type: 'Point',
        coordinates: location
      },
      properties: {
        title: name,
        date: date,
        'marker-symbol' => 'circle'
      }
    }
  end
end
