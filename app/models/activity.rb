class Activity < ActiveRecord::Base
  belongs_to :trip

  validates :name, :date, presence: true

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
