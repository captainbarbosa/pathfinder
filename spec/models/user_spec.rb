require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :users

  it 'should have an email' do
    expect(users(:leif_ericksson).email).to eq 'leif@explorer.com'
  end

  it 'should have a first name' do
    expect(users(:leif_ericksson).first_name).to eq 'Leif'
  end

  it 'should have a last name' do
    expect(users(:leif_ericksson).last_name).to eq 'Ericksson'
  end
end
