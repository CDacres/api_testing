require 'httparty'
require 'json'

class AllCountries
  include HTTParty

  base_uri 'https://restcountries.eu/rest/v2'

  def get_all_countries
    JSON.parse(self.class.get("/all").body)
  end

  def number_of_countries
    get_all_countries.length
  end

  def get_all_country_names
    all_country_names = []
    get_all_countries.each do |i|
      all_country_names << i['name']
    end
    all_country_names
  end

  def get_random_country
    get_all_countries.sample
  end

  def get_random_country_name
    get_random_country['name']
  end

end
