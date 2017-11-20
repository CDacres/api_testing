require 'spec_helper'

describe 'Validate Countries' do

  context 'All Countries' do

    before(:all) do
      countries_service = CountriesService.new
      @countries = countries_service.all_countries
    end

    it 'should return an array of 250 countries' do
      expect(@countries.get_all_countries).to be_a(Array)
      expect(@countries.number_of_countries).to eq 250
    end

  end

  context 'Search Countries' do

    before(:all) do
      countries_service = CountriesService.new
      @countries = countries_service.search_countries
    end

    it 'should return a valid country name when searched' do
      name = 'france'
      country_name = @countries.search_for_a_country(name)[0]['name']
      expect(country_name).to be_a(String)
    end

  end

  context 'Search by Language' do

    before(:all) do
      countries_service = CountriesService.new
      @countries = countries_service.search_language
    end

    it 'should determine all the countries that speak english' do
      expect(@countries.all_countries_that_speak('en')).to be_a(Array)
      expect(@countries.all_countries_that_speak('en').length).to eq 91
    end

    it 'should determine the total world population that might speak english' do
      expect(@countries.population_that_speak('en')).to be_a(Integer)
    end

  end

  context 'Search by Capital' do

    before(:all) do
      countries_service = CountriesService.new
      @countries = countries_service.search_capital
    end

    it 'should return the country name when its capital is searched' do
      capital = 'paris'
      expect(@countries.search_by_capital(capital)[0]['name']).to eq "France"
    end

  end

end
