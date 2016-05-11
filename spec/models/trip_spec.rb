require 'rails_helper'

RSpec.describe Trip, type: :model do
  fixtures :trips, :users, :activities

  it 'should have a name' do
    expect(trips(:iceland).name).to eq 'Iceland'
  end

  it 'should have a description' do
    expect(trips(:iceland).description).to eq 'More of like a staycation'
  end

  it 'should belong to a user' do
    expect(trips(:iceland).user.id).to eq users(:leif_ericksson).id
  end

  it 'should require name' do
    @trip_without_name = Trip.create(description: '10 days of hiking')
    @valid_trip = Trip.create(name: 'Patagonia', description: '10 days of hiking')

    expect(@trip_without_name.valid?).to be false
    expect(@valid_trip.valid?).to be true
  end

  it 'should delete its activities when trip is deleted' do
    @trip = trips(:iceland)
    @activity = activities(:glacier_climbing)
    @trip.destroy

    expect(@trip.activities).to eq []
  end
end
