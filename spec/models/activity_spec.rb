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

  it 'should require trip_id, name, and date for creation' do
    @trip = trips(:iceland)
    @@activity_without_trip_id = Activity.create(name: 'Fishing', date: '2016-05-10 17:32:02')
    @activity_without_name = Activity.create(trip_id: @trip.id, date: '2016-05-10 17:32:02')
    @activity_without_date = Activity.create(trip_id: @trip.id, name: 'Whale Watching')
    @valid_activity = Activity.create(trip_id: @trip.id, name: 'Whale Watching', date: '2016-05-10 17:32:02')

    expect(@activity_without_trip_id.valid?).to be false
    expect(@activity_without_name.valid?).to be false
    expect(@activity_without_date.valid?).to be false
    expect(@valid_activity.valid?).to be true
  end
end
