require 'rails_helper'

RSpec.describe TripsHelper, type: 'helper' do
  fixtures :trips, :activities
  it "gives activities as geoJSON" do
    result = helper.activities_geojson(trips(:iceland))
    result = JSON.parse(result)
    expect(result).to be_a Array
    expect(result[0]).to be_a Hash
    expect(result[0]["geometry"]["coordinates"]).to eql [0.0, 0.0]
  end
end
