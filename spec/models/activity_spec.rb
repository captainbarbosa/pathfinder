require 'rails_helper'

RSpec.describe Activity, type: :model do
  fixtures :activities, :trips

  it 'should have a name' do
    expect(activities(:fishing).name).to eq 'Sunrise Fishing Trip'
  end

  it 'should belong to a trip' do
    expect(activities(:fishing).trip_id).to eq trips(:iceland).id
  end

  it 'should have a date' do
    expect(activities(:fishing).date).to eq "2016-01-03 06:00:00"
  end

  it 'should have a description' do
    expect(activities(:fishing).description).to eq "Looking to catch some cod and salmon"
  end
end
