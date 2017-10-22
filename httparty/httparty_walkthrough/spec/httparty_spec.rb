require 'spec_helper'

describe 'Validate postcodes.io fields' do

  before(:all) do
    @postcodes = JSON.parse(HTTParty.get('https://api.postcodes.io/postcodes/WD247NX').body)
  end

  it 'should have a postcode which is a string' do
    expect(@postcodes['result']['postcode']).to be_a(String)
  end

  it 'should have a postcode of maximum 8 characters' do
    expect(@postcodes['result']['postcode'].length).to be <= 8
  end

  it 'should have a postcode containing a space' do
    expect(@postcodes['result']['postcode']).to include(' ')
  end

  it 'should have a quality value that is an integer' do
    expect(@postcodes['result']['quality']).to be_a(Integer)
  end

  it 'should have a quality value between 1 & 9, excluding 7' do
    expect(@postcodes['result']['quality']).to be_between(1,9)
    expect(@postcodes['result']['quality']).not_to eq(7)
  end

  it 'should have an eastings which is either an integer or null' do
    if @postcodes['result']['eastings'].class == Integer
      expect(@postcodes['result']['eastings']).to be_a(Integer)
    elsif @postcodes['result']['eastings'].class == NIL
      expect(@postcodes['result']['eastings']).to be_a(NIL)
    end
  end

  it 'should have an northings which is either an integer or null' do
    if @postcodes['result']['northings'].class == Integer
      expect(@postcodes['result']['northings']).to be_a(Integer)
    elsif @postcodes['result']['northings'].class == NIL
      expect(@postcodes['result']['northings']).to be_a(NIL)
    end
  end

  it 'should have a country which is a string' do
    expect(@postcodes['result']['country']).to be_a(String)
  end

end
