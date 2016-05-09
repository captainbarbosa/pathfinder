require 'rails_helper'

RSpec.describe Trip, type: :model do
  fixtures :trips, :users

  it 'should have a name' do
    expect(trips(:iceland).name).to eq 'Iceland'
  end

  it 'should have a description' do
    expect(trips(:iceland).description).to eq 'More of like a staycation'
  end

  it 'should belong to a user' do
    expect(trips(:iceland).user.id).to eq users(:leif_ericksson).id
  end
end
