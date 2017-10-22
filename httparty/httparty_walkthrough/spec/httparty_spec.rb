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

  it 'should have an incode 3 characters long' do
    expect(@postcodes['result']['incode'].length).to eq(3)
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

  it 'should have a region which is either a string or null' do
    if @postcodes['result']['region'].class == String
      expect(@postcodes['result']['region']).to be_a(String)
    elsif @postcodes['result']['region'].class == NIL
      expect(@postcodes['result']['region']).to be_a(NIL)
    end
  end

  it 'should have an primary_care_trust which is either a string or null' do
    if @postcodes['result']['primary_care_trust'].class == String
      expect(@postcodes['result']['primary_care_trust']).to be_a(String)
    elsif @postcodes['result']['primary_care_trust'].class == NIL
      expect(@postcodes['result']['primary_care_trust']).to be_a(NIL)
    end
  end

  it 'should have an nhs_ha which is either a string or null' do
    if @postcodes['result']['nhs_ha'].class == String
      expect(@postcodes['result']['nhs_ha']).to be_a(String)
    elsif @postcodes['result']['nhs_ha'].class == NIL
      expect(@postcodes['result']['nhs_ha']).to be_a(NIL)
    end
  end

  it 'should have an admin_county which is either a string or null' do
    if @postcodes['result']['admin_county'].class == String
      expect(@postcodes['result']['admin_county']).to be_a(String)
    elsif @postcodes['result']['admin_county'].class == NIL
      expect(@postcodes['result']['admin_county']).to be_a(NIL)
    end
  end

  it 'should have an admin_district which is either a string or null' do
    if @postcodes['result']['admin_district'].class == String
      expect(@postcodes['result']['admin_district']).to be_a(String)
    elsif @postcodes['result']['admin_district'].class == NIL
      expect(@postcodes['result']['admin_district']).to be_a(NIL)
    end
  end

  it 'should have an admin_ward which is either a string or null' do
    if @postcodes['result']['admin_ward'].class == String
      expect(@postcodes['result']['admin_ward']).to be_a(String)
    elsif @postcodes['result']['admin_ward'].class == NIL
      expect(@postcodes['result']['admin_ward']).to be_a(NIL)
    end
  end

  it 'should have an longitude which is either a float or null' do
    if @postcodes['result']['longitude'].class == Float
      expect(@postcodes['result']['longitude']).to be_a(Float)
    elsif @postcodes['result']['longitude'].class == NIL
      expect(@postcodes['result']['longitude']).to be_a(NIL)
    end
  end

  it 'should have an latitude which is either a float or null' do
    if @postcodes['result']['latitude'].class == Float
      expect(@postcodes['result']['latitude']).to be_a(Float)
    elsif @postcodes['result']['latitude'].class == NIL
      expect(@postcodes['result']['latitude']).to be_a(NIL)
    end
  end

  it 'should have an parliamentary_constituency which is either a string or null' do
    if @postcodes['result']['parliamentary_constituency'].class == String
      expect(@postcodes['result']['parliamentary_constituency']).to be_a(String)
    elsif @postcodes['result']['parliamentary_constituency'].class == NIL
      expect(@postcodes['result']['parliamentary_constituency']).to be_a(NIL)
    end
  end

  it 'should have an european_electoral_region which is either a string or null' do
    if @postcodes['result']['european_electoral_region'].class == String
      expect(@postcodes['result']['european_electoral_region']).to be_a(String)
    elsif @postcodes['result']['european_electoral_region'].class == NIL
      expect(@postcodes['result']['european_electoral_region']).to be_a(NIL)
    end
  end

  it 'should have a parish which is either a string or null' do
    if @postcodes['result']['parish'].class == String
      expect(@postcodes['result']['parish']).to be_a(String)
    elsif @postcodes['result']['parish'].class == NIL
      expect(@postcodes['result']['parish']).to be_a(NIL)
    end
  end

  it 'should have a lsoa which is either a string or null' do
    if @postcodes['result']['lsoa'].class == String
      expect(@postcodes['result']['lsoa']).to be_a(String)
    elsif @postcodes['result']['lsoa'].class == NIL
      expect(@postcodes['result']['lsoa']).to be_a(NIL)
    end
  end

  it 'should have a msoa which is either a string or null' do
    if @postcodes['result']['msoa'].class == String
      expect(@postcodes['result']['msoa']).to be_a(String)
    elsif @postcodes['result']['msoa'].class == NIL
      expect(@postcodes['result']['msoa']).to be_a(NIL)
    end
  end

  it 'should have a ccg which is either a string or null' do
    if @postcodes['result']['ccg'].class == String
      expect(@postcodes['result']['ccg']).to be_a(String)
    elsif @postcodes['result']['ccg'].class == NIL
      expect(@postcodes['result']['ccg']).to be_a(NIL)
    end
  end

  it 'should have a nuts which is either a string or null' do
    if @postcodes['result']['nuts'].class == String
      expect(@postcodes['result']['nuts']).to be_a(String)
    elsif @postcodes['result']['nuts'].class == NIL
      expect(@postcodes['result']['nuts']).to be_a(NIL)
    end
  end

  it 'should have a codes value that is a hash' do
    expect(@postcodes['result']['codes']).to be_a(Hash)
  end

  it 'should have a codes hash contains 7 key-value pairs' do
    expect(@postcodes['result']['codes'].keys.count).to eq(7)
  end

  it 'should have a codes hash containing a code for admin_district' do
    expect(@postcodes['result']['codes'].keys).to include('admin_district')
  end

  it 'should have a codes hash containing a code for admin_county' do
    expect(@postcodes['result']['codes'].keys).to include('admin_county')
  end

  it 'should have a codes hash containing a code for admin_ward' do
    expect(@postcodes['result']['codes'].keys).to include('admin_ward')
  end

  it 'should have a codes hash containing a code for parish' do
    expect(@postcodes['result']['codes'].keys).to include('parish')
  end

  it 'should have a codes hash containing a code for parliamentary_constituency' do
    expect(@postcodes['result']['codes'].keys).to include('parliamentary_constituency')
  end

  it 'should have a codes hash containing a code for ccg' do
    expect(@postcodes['result']['codes'].keys).to include('ccg')
  end

  it 'should have a codes hash containing a code for nuts' do
    expect(@postcodes['result']['codes'].keys).to include('nuts')
  end

  it 'should have a code for admin_district which is a string' do
    expect(@postcodes['result']['codes']['admin_district']).to be_a(String)
  end

  it 'should have a code for admin_county which is a string' do
    expect(@postcodes['result']['codes']['admin_county']).to be_a(String)
  end

  it 'should have a code for admin_ward which is a string' do
    expect(@postcodes['result']['codes']['admin_ward']).to be_a(String)
  end

  it 'should have a code for parish which is a string' do
    expect(@postcodes['result']['codes']['parish']).to be_a(String)
  end

  it 'should have a code for parliamentary_constituency which is a string' do
    expect(@postcodes['result']['codes']['parliamentary_constituency']).to be_a(String)
  end

  it 'should have a code for ccg which is a string' do
    expect(@postcodes['result']['codes']['ccg']).to be_a(String)
  end

  it 'should have a code for nuts which is either a string or null' do
    if @postcodes['result']['codes']['nuts'].class == String
      expect(@postcodes['result']['codes']['nuts']).to be_a(String)
    elsif @postcodes['result']['codes']['nuts'].class == NIL
      expect(@postcodes['result']['codes']['nuts']).to be_a(NIL)
    end
  end

  it 'should have a code for admin_district which is 9 characters long' do
    expect(@postcodes['result']['codes']['admin_district'].length).to eq(9)
  end

  it 'should have a code for admin_county which is 9 characters long' do
    expect(@postcodes['result']['codes']['admin_county'].length).to eq(9)
  end

  it 'should have a code for admin_ward which is 9 characters long' do
    expect(@postcodes['result']['codes']['admin_ward'].length).to eq(9)
  end

  it 'should have a code for parish which is 9 characters long' do
    expect(@postcodes['result']['codes']['parish'].length).to eq(9)
  end

  it 'should have a code for parliamentary_constituency which is 9 characters long' do
    expect(@postcodes['result']['codes']['parliamentary_constituency'].length).to eq(9)
  end

  it 'should have a code for ccg which is 9 characters long' do
    expect(@postcodes['result']['codes']['ccg'].length).to eq(9)
  end

  it 'should have a code for nuts which if not null is 5 characters long' do
    if @postcodes['result']['codes']['nuts'].class == String
      expect(@postcodes['result']['codes']['nuts'].length).to eq(5)
    end
  end

end
